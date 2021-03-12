<?php

// file_put_contents("storage/log_check.txt", $request);
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;

class ChatController extends Controller
{
  public function __construct()
  {

    // <고객> 이용 정지 회원인지 확인
    function user_check($id){
      $stop = \App\user_info::where('id',$id)->first();
      if($stop['on/off'] == 'off'){
        return response()->json([
          'result' => false
        ]);
      }
    }

    // <의사> 이용 정지 회원인지 확인
    function doctor_check($id){
      $stop = \App\doctor_info::where('id',$id)->first();
      if($stop['on/off'] == 'off'){
        return response()->json([
          'result' => false
        ]);
      }
    }

    function fcm($title,$body,$data,$token,$type,$channel){
    // function fcm($data,$token,$type){
      $SERVER_KEY = "AAAAEoPJN6I:APA91bGXvocWzcIU-xYKXw5PovzaWMV05eS6_MuJGzR9NVmwiU6ZjnKZKTsKymq_s-voRFDmY5UjqvUylXe1awO4S-UYSekDvYeau6Wqsra2BTRrVDmHs8-ZKUri_rjqrdmkSgzXwt7j";

      $url = "https://fcm.googleapis.com/fcm/send";

      $notification = array('title' => $title , 'body' => $body, 'sound' => 'default', 'badge' => '1', 'click_action' => '.MainActivity', 'android_channel_id' => $channel);

      if($type == "doctor"){
        $arrayToSend = array('registration_ids' => $token, 'notification' => $notification, 'data' => $data, 'priority' => 'high');
        // $arrayToSend = array('registration_ids' => $token, 'data' => $data, 'priority' => 'high');
      }else{
        $arrayToSend = array('to' => $token, 'notification' => $notification, 'data' => $data, 'priority' => 'high');
        // $arrayToSend = array('to' => $token, 'data' => $data, 'priority' => 'high');
      }

      $json = json_encode($arrayToSend);
      $headers = array();
      $headers[] = 'Content-Type: application/json';
      $headers[] = 'Authorization: key=' . $SERVER_KEY;

      $ch = curl_init();
      curl_setopt($ch, CURLOPT_URL, $url);
      curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"POST");
      curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
      curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
      //Send the request
      $response = curl_exec($ch);

      return $response;
    }

    function check_time($type, $id){
      if($type == "doctor"){
        $time = \App\chat_request::where([['state','ing'],['doctor_id',$id]])->get();
      }else{
        $time = \App\chat_request::where([['state','ing'],['user_id',$id]])->get();
      }
      if($time != "[]"){
        foreach ($time as $chat) {
          if($chat->extra_time != null){
            $start = $chat->created_at;
            $start = date("Y-m-d H:i:s", strtotime($start."+".$chat->extra_time." minutes"));
            $end = date("Y-m-d H:i:s", strtotime($start."+20 minutes"));
          }else{
            $start = $chat->created_at;
            $end = date("Y-m-d H:i:s", strtotime($start."+20 minutes"));
          }
          $now = date("Y-m-d H:i:s");
          if($now > $end){
            $channel_id = "GJCIaUNfqtlHkHrF";

            $url = "https://api2.scaledrone.com/".$channel_id."/".$chat->pet_id."/publish";

            // $json = json_encode($body);
            $headers = array();
            $headers[] = 'Content-Type: application/json';

            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"POST");
            // curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
            curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);

            $body = array('state' => "off");
            $json = json_encode($body);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
            //Send the request
            $response = curl_exec($ch);

            if ($response === false) {
              return response()->json([
                "result" => false,
              ]);
            }
            //Close request
            curl_close($ch);

            $chat_end = \App\chat_request::where('id',$chat->id)->update(['state'=>'finish']);
            $chat_request = \App\chat_request::where('id',$chat->id)->first();

            // 포인트 적립
            $price = config('app.price');
            $accumulate = \App\accumulate::create([
              "doctor_id" => $chat_request->doctor_id,
              "chat_request_id" => $chat->id,
              "point" => $price,
            ]);
          }
        }
      }
    }
  }

  // 일반 사용자가 의사에게 채팅 요청 및 상태확인
  public function request(Request $request)
  {
    $time = "20"; // 재응답 시간 (초)
    $how = "10"; // 몇명에게 전송할지
    if($request['count']=="1"){

      // 정지회원 이용 제한
      $user = \App\user_info::where('id',$request['user_id'])->first();
      if($user['on/off'] != "on"){
        return response()->json([
          'result' => false,
          'warning' => "stop_member",
        ]);
      }

      //이용권 없을시 사용불가
      if($user['ticket'] < "1"){
        return response()->json([
          'result' => false,
          'warning' => "no_ticket",
        ]);
      }

      //채팅중일때 다른 채팅 불가
      $chat_check = \App\chat_request::where([['pet_id',$request['pet_id']],['state','ing']])->first();
      if(isset($chat_check)){
        return response()->json([
          'result' => false,
          'warning' => "chat_ing",
        ]);
      }

      $match_query = "6371 * acos( cos( radians(".$request['latitude'].") ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians(".$request['longitude'].") ) + sin( radians(".$request['latitude'].") ) * sin( radians( latitude ) ) ) as distance";
      $count = \App\doctor_info::select('id', 'state', 'on/off', 'fcm_token','approval', DB::raw($match_query))
      -> where([["state","on"],["on/off","on"],['approval',"complete"]],['doctor_phone','<>',$user->user_phone])
      -> havingRaw('distance <'.$request['distance'])
      ->get()->count();

      if($count == "0"){  //매칭 실패 경우
        $chat_request = \App\chat_request::create([
          'user_id' => $request['user_id'],
          'pet_id' => $request['pet_id'],
          'latitude' => $request['latitude'],
          'longitude' => $request['longitude'],
          'distance' => $request['distance'],
          'chat_title' => $request['chat_title'],
          'chat_content' => $request['chat_content'],
          'address' => $request['address'],
          'state' => "off",
        ]);
        return response()->json([
          'result' => false,
          'warning' => "no_matching",
        ]);
      }
      $chat_request = \App\chat_request::create([
        'user_id' => $request['user_id'],
        'pet_id' => $request['pet_id'],
        'latitude' => $request['latitude'],
        'longitude' => $request['longitude'],
        'distance' => $request['distance'],
        'chat_title' => $request['chat_title'],
        'chat_content' => $request['chat_content'],
        'address' => $request['address'],
      ]);

      //매칭 쿼리
      $doctor = \App\doctor_info::select('id', 'state', 'on/off', 'fcm_token', 'approval', DB::raw($match_query))
      ->where([["state","on"],["on/off","on"],['approval','complete']])
      ->havingRaw('distance <'.$request['distance'])
      ->limit($how)
      ->get();

      //다음 채팅시 제외할 의사들
      $except = array();
      //-------------------fcm 발송
      $token = array();
      foreach ($doctor as $i => $idx) {
        $token[$i] = $idx->fcm_token;
        $except[$i] = $idx->id;
      }

      $except_list = \App\except_list::create([
        'chat_request_id' => $chat_request->id,
        'except' => serialize($except),
      ]);

      //notification 부분
      $title = "상담신청이 왔습니다.";
      $body = "클릭해서 확인해주세요.";
      //data 부분
      $channel = "1";
      $data = array('chat_request_id' => $chat_request->id, "android_channel_id" => $channel);
      // $data = array('chat_request_id' => $chat_request->id, 'type' => "0", "title" => $title, "body" => $body);

      $type = "doctor";
      //발송
      $response = fcm($title,$body,$data,$token,$type,$channel);
      // $response = fcm($data,$token,$type);

      foreach ($except as $i=> $doctor) {
        if(isset($token[$i])){
          $log = \App\fcm_log::create([
            'id_type' => 'doctor',
            'fcm_id' => $doctor,
            'type' => "채팅 요청",
            'ip_address' => $_SERVER["REMOTE_ADDR"],
          ]);
        }
      }

      return response()->json([
        'result' => true,
        'chat_request_id' => $chat_request->id,
        'time' => $time,
      ]);
    }else{
      $chat_request_id = \App\chat_request::where('id', $request['chat_request_id'])->first();

      if(isset($chat_request_id)){
        if($chat_request_id['state'] == "wait"){  //아직 대기중


          // 정지회원 이용 제한
          $check = \App\user_info::where('id',$request['user_id'])->first();
          if($check['on/off'] != "on"){
            $chat_request = \App\chat_request::where("id",$request['chat_request_id'])->update([
              'state' => "off",
            ]);
            return response()->json([
              'state' => false,
              'result' => false,
            ]);
          }

          //제외할 의사
          $except = array();
          $except_list = \App\except_list::where("chat_request_id",$request['chat_request_id'])->first();
          $except = unserialize($except_list->except);

          //매칭 쿼리
          $match_query = "6371 * acos( cos( radians(".$chat_request_id->latitude.") ) * cos( radians( latitude ) ) * cos( radians( longitude ) - radians(".$chat_request_id->longitude.") ) + sin( radians(".$chat_request_id->latitude.") ) * sin( radians( latitude ) ) ) as distance";

          $doctor = \App\doctor_info::select('id', 'state', 'on/off', 'fcm_token', 'approval', DB::raw($match_query))
          ->whereNotIn('id',$except)
          ->where([["state","on"],["on/off","on"],['approval','complete']])
          ->havingRaw('distance <'.$chat_request_id['distance'])
          ->limit($how)
          ->get();

          if($doctor == "[]"){
            $chat_request = \App\chat_request::where("id",$request['chat_request_id'])->update([
              'state' => "off",
            ]);
            return response()->json([
              'state' => false,
              'result' => false,
            ]);
          }else{
            //다음 제외할 의사
            $count = count($except);

            //-------------------fcm 발송
            $token = array();
            foreach ($doctor as $i => $idx) {
              $token[$i] = $idx->fcm_token;
              $except[$count] = $idx->id;
              $count++;
            }

            $except_list = \App\except_list::where("chat_request_id",$request['chat_request_id'])->update([
              'except' => serialize($except),
            ]);

            //notification 부분
            $title = "상담신청이 왔습니다.";
            $body = "클릭해서 확인해주세요.";

            //data 부분
            $channel = "1";
            $data = array('chat_request_id' => $request['chat_request_id'], "android_channel_id" => $channel);
            // $data = array('chat_request_id' => $chat_request->id, 'type' => "0", "title" => $title, "body" => $body);

            $type = "doctor";
            //발송
            $response = fcm($title,$body,$data,$token,$type,$channel);
            // $response = fcm($data,$token,$type);

            foreach ($except as $i=> $doctor) {
              if(isset($token[$i])){
                $log = \App\fcm_log::create([
                  'id_type' => 'doctor',
                  'fcm_id' => $doctor,
                  'type' => "채팅 요청",
                  'ip_address' => $_SERVER["REMOTE_ADDR"],
                ]);
              }
            }

            return response()->json([
              'state' => false,
              'result' => true,
            ]);
          }
        }elseif ($chat_request_id['state'] == "ing") {  //채팅 연결
          $pet = \App\pet_info::where("id",$chat_request_id['pet_id'])->first();
          return response()->json([
            'state' => true,
            'chat_room' => $chat_request_id['pet_id'],
            'pet_name' => $pet->pet_name,
          ]);
        }else{
          trigger_error("Server Error", E_USER_ERROR);
        }
      }
      trigger_error("Server Error", E_USER_ERROR);
    }
  }

  // 일반 사용자가 의사에게 채팅 요청 취소
  public function cancel(Request $request)
  {
    $chat_request_id = \App\chat_request::where('id', $request['chat_request_id'])->first();

    // 이용 정지 회원인지 확인
    $q = user_check($chat_request_id->user_id);
    if(isset($q)){
      return $q;
    }

    if($chat_request_id->state == "ing"){
      $pet = \App\pet_info::where("id",$chat_request_id['pet_id'])->first();
      return response()->json([
        'result' => false,
        'chat_room' => $chat_request_id->pet_id,
        'pet_name' => $pet->pet_name,
      ]);
    }
    $cancel = \App\chat_request::where('id',$request['chat_request_id'])->update(['state' => 'off']);
    return response()->json([
      'result' => true,
    ]);
  }

  // 의사가 채팅 푸시알림으로 인해 채팅 요청 확인
  public function response(Request $request)
  {

    $info = \App\chat_request::where('id',$request['chat_request_id'])->first();
    $pet = \App\pet_info::where('id',$info->pet_id)->first();

    if(isset($info)){
      return response()->json([
        'result' => true,
        'chat_title' => $info->chat_title,
        'chat_content' => $info->chat_content,
        'address' => $info->address,
        'pet_name' => $pet->pet_name,
        'pet_age' => $pet->pet_age,
        'pet_birth' => $pet->pet_birth,
        'pet_gender' => $pet->pet_gender,
        'pet_main_type' => $pet->pet_main_type,
        'pet_sub_type' => $pet->pet_sub_type,
        'pet_notice' => $pet->pet_notice,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  // 의사가 채팅 수락
  public function accept(Request $request)
  {
    $info = \App\chat_request::where('id',$request['chat_request_id'])->first();

    // <의사> 이용 정지 회원인지 확인
    $q = doctor_check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    if($info->state == "wait"){

      $user = \App\user_info::where("id",$info->user_id)->first();

      // <고객> 이용 정지 회원인지 확인
      $q = user_check($user->id);
      if(isset($q)){
        return $q;
      }

      if($user->ticket == "0"){
        return response()->json([
          'result' => false,
        ]);
      }else{
        // 고객회원 이용권 갯수 차감
        $check = \App\user_info::where("id",$info->user_id)->update([
          'ticket' => $user->ticket-1,
        ]);

        //-------------------fcm 발송
        $token = $user->fcm_token;

        //notification 부분
        $title = "상담이 시작되었습니다.";
        $body = "클릭해서 확인해주세요.";

        $pet = \App\pet_info::where("id",$info->pet_id)->first();
        //data 부분
        $channel = "1";
        $data = array('chat_room' => $info->pet_id, 'chat_request_id' => $request['chat_request_id'], 'pet_name' => $pet->pet_name, "android_channel_id" => $channel);
        // $data = array('chat_request_id' => $chat_request->id, 'type' => "0", "title" => $title, "body" => $body);

        $type = "user";
        //발송
        $response = fcm($title,$body,$data,$token,$type,$channel);
        // $response = fcm($data,$token,$type);

        if(isset($token)){
          $log = \App\fcm_log::create([
            'id_type' => 'user',
            'fcm_id' => $user->id,
            'type' => "채팅 연결",
            'ip_address' => $_SERVER["REMOTE_ADDR"],
          ]);
        }

        $info_change = \App\chat_request::where('id',$request['chat_request_id'])->update([
          "doctor_id" => $request['doctor_id'],
          "state" => 'ing',
          "created_at" => now(),
        ]);

        return response()->json([
          'result' => true,
          'chat_room' => $info->pet_id,
          'chat_request_id' => $request['chat_request_id'],
          'pet_name' => $pet->pet_name,
        ]);
      }
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  // 채팅방 들어갈때 채팅 불러오기 (유저/의사)
  public function load(Request $request)
  {
    if($request['id_type'] == "doctor"){
      // <의사> 이용 정지 회원인지 확인
      check_time('doctor',$request->doctor_id);
      $q = doctor_check($request->doctor_id);
      if(isset($q)){
        return $q;
      }
    }else{
      // <고객> 이용 정지 회원인지 확인
      check_time('user',$request->user_id);
      $q = user_check($request->user_id);
      if(isset($q)){
        return $q;
      }
    }

    $id_type = array(); $send_id = array(); $message_type = array(); $message = array(); $date = array(); $chat_request_id = array();
    if($request['chat_state'] != null){  //채팅상태가 있으면 <목록에서 들어온 경우>
      if($request['id_type'] == "doctor"){  // 의사앱에서 채팅 불러오는 경우
        if($request['chat_state'] == "ing"){  // 채팅중인 경우
          $chats = \App\chat::where('room',$request['chat_room'])->get();
          if($chats == "[]"){
            return response()->json([
              "result" => true,
            ]);
          }
          foreach ($chats as $i => $chat) {  //모든 채팅 불러오기
            $id_type[$i] = $chat->id_type;
            if($chat->id_type =="doctor"){
              if($chat->send_doctor == $request['doctor_id']){
                $doctor = \App\doctor_info::where('id',$request['doctor_id'])->first();
                $send_id[$i] = $doctor->doctor_name;
              }else{
                $send_id[$i] = "**다른 의사**";
              }
            }else{
              $user = \App\user_info::where('id',$chat->send_user)->first();
              if($user['on/off'] != "on"){
                $send_id[$i] = "**알수없는 고객**";
              }else{
                $send_id[$i] = $user->user_nick;
              }
              $send_id[$i] = $user->user_nick;
            }
            $message_type[$i] = $chat->message_type;
            $message[$i] = $chat->message;
            $time=date_create($chat->created_at);
            $date[$i] = date_format($time,"Y-m-d H:i");
            $chat_request_id[$i] = $chat->request_id;
          }
        }else{  // 채팅중이 아닌경우 <자기것만 볼수있음>
          $infos = \App\chat_request::where([['doctor_id',$request['doctor_id']],['pet_id',$request['chat_room']]])->get();
          $count = "0";
          foreach ($infos as $info) {
            $chats = \App\chat::where('request_id',$info->id)->get();
            if($chats != "[]"){
              foreach ($chats as $i => $chat) {
                $i = $count + $i;
                $id_type[$i] = $chat->id_type;
                if($chat->id_type =="doctor"){
                  $doctor = \App\doctor_info::where('id',$request['doctor_id'])->first();
                  $send_id[$i] = $doctor->doctor_name;
                }else{
                  $user = \App\user_info::where('id',$chat->send_user)->first();
                  if($user['on/off'] != "on"){
                    $send_id[$i] = "**알수없는 고객**";
                  }else{
                    $send_id[$i] = $user->user_nick;
                  }
                }
                $message_type[$i] = $chat->message_type;
                $message[$i] = $chat->message;
                $time=date_create($chat->created_at);
                $date[$i] = date_format($time,"Y-m-d H:i");
                $chat_request_id[$i] = $chat->request_id;
              }
              $count = $i + 1;
            }
          }
          if($count=="0"){
            return response()->json([
              "result" => true,
            ]);
          }
        }
      }else{   //유저앱에서 채팅을 불러온 경우
        $chats = \App\chat::where('room',$request['chat_room'])->get();
        if($chats == "[]"){
          return response()->json([
            "result" => true,
          ]);
        }
        foreach ($chats as $i => $chat) {  //모든 채팅 불러오기
          $id_type[$i] = $chat->id_type;
          if($chat->id_type =="doctor"){
            $doctor = \App\doctor_info::where('id',$chat->send_doctor)->first();
            if($doctor['on/off'] != "on"){
              $send_id[$i] = "**알수없는 의사**";
            }else{
              $send_id[$i] = $doctor->doctor_name;
            }
          }else{
            $user = \App\user_info::where('id',$chat->send_user)->first();
            $send_id[$i] = $user->user_nick;
          }
          $message_type[$i] = $chat->message_type;
          $message[$i] = $chat->message;
          $time=date_create($chat->created_at);
          $date[$i] = date_format($time,"Y-m-d H:i");
          $chat_request_id[$i] = $chat->request_id;
        }
      }
    }else{ // <매칭후 바로 들어온 경우>
      if($request['id_type'] == "doctor"){  //의사앱에서 채팅 불러오는 경우
        $chats = \App\chat::where('room',$request['chat_room'])->get();
        if($chats == "[]"){
          return response()->json([
            "result" => true,
          ]);
        }
        foreach ($chats as $i => $chat) {  //모든 채팅 불러오기
          $id_type[$i] = $chat->id_type;
          if($chat->id_type =="doctor"){
            if($chat->send_doctor == $request['doctor_id']){
              $doctor = \App\doctor_info::where('id',$request['doctor_id'])->first();
              $send_id[$i] = $doctor->doctor_name;
            }else{
              $send_id[$i] = "**다른 의사**";
            }
          }else{
            $user = \App\user_info::where('id',$chat->send_user)->first();
            if($user['on/off'] != "on"){
              $send_id[$i] = "**알수없는 고객**";
            }else{
              $send_id[$i] = $user->user_nick;
            }
          }
          $message_type[$i] = $chat->message_type;
          $message[$i] = $chat->message;
          $time=date_create($chat->created_at);
          $date[$i] = date_format($time,"Y-m-d H:i");
          $chat_request_id[$i] = $chat->request_id;
        }
      }else{  //유저앱에서 채팅을 불러온 경우
        $chats = \App\chat::where('room',$request['chat_room'])->get();
        if($chats == "[]"){
          return response()->json([
            "result" => true,
          ]);
        }
        foreach ($chats as $i => $chat) {  //모든 채팅 불러오기
          $id_type[$i] = $chat->id_type;
          if($chat->id_type =="doctor"){
            $doctor = \App\doctor_info::where('id',$chat->send_doctor)->first();
            if($doctor['on/off'] != "on"){
              $send_id[$i] = "**알수없는 의사**";
            }else{
              $send_id[$i] = $doctor->doctor_name;
            }
          }else{
            $user = \App\user_info::where('id',$chat->send_user)->first();
            $send_id[$i] = $user->user_nick;
          }
          $message_type[$i] = $chat->message_type;
          $message[$i] = $chat->message;
          $time=date_create($chat->created_at);
          $date[$i] = date_format($time,"Y-m-d H:i");
          $chat_request_id[$i] = $chat->request_id;
        }
      }
    }

    return response()->json([
      "result" => true,
      "id_type" => $id_type,
      "send_id" => $send_id,
      "message_type" => $message_type,
      "message" => $message,
      "date" => $date,
      "chat_request_id" => $chat_request_id,
    ]);
  }

  // 채팅방 목록 불러오기 (유저/의사)
  public function list(Request $request)
  {
    if($request['id_type'] == "doctor"){
      // <의사> 이용 정지 회원인지 확인
      check_time('doctor',$request->doctor_id);
      $q = doctor_check($request->doctor_id);
      if(isset($q)){
        return $q;
      }
    }else{
      // <고객> 이용 정지 회원인지 확인
      check_time('user',$request->user_id);
      $q = user_check($request->user_id);
      if(isset($q)){
        return $q;
      }
    }

    $chat_room = array(); $pet_name = array(); $chat_state = array(); $chat_request_id = array(); $date = array(); $message = array(); $pet_img = array();
    if($request['id_type'] == "doctor"){
      $type ="doctor_id";
      $id =$request->doctor_id;
    }else{
      $type ="user_id";
      $id =$request->user_id;
    }

    $chats = \App\chat_request::select('pet_id','state','message','chat_request.id',DB::raw("if (isnull(chat.created_at), chat_request.created_at, chat.created_at) as time"))
    ->fromsub(function($query) use ($type,$id){
      $query->from('chat_request')->whereIn('state',['ing','finish'])->where($type,$id)->orderBy('id','desc')->limit("18446744073709551615");
    },'chat_request')
    ->leftjoinsub(function($query) {
      $query->from('chat')->orderBy('id','desc')->limit("18446744073709551615");
    },'chat','chat_request.id','=','chat.request_id')->groupBy('pet_id')->orderBy('time','desc')->get();

    foreach ($chats as $i => $chat) {
      $pet = \App\pet_info::where('id',$chat->pet_id)->first();
      $chat_room[$i] = $chat->pet_id;
      if($pet['on/off'] == "off"){
          $pet_name[$i] = "삭제된 반려동물 입니다.";
      }else{
        $pet_name[$i] = $pet->pet_name;
      }
      $chat_state[$i] = $chat->state;
      $chat_request_id[$i] = $chat->id;
      if($chat->message == null){
        $message[$i] = "상담이 시작되었습니다.";
      }else{
        $message[$i] = $chat->message;
      }
      $date[$i] = $chat->time;
      $pet_img[$i] = $pet->pet_img;
    }
    return response()->json([
      "result" => true,
      "chat_room" => $chat_room,
      "pet_name" => $pet_name,
      "chat_state" => $chat_state,
      "chat_request_id" => $chat_request_id,
      "message" => $message,
      "date" => $date,
      "pet_img" => $pet_img,
    ]);
  }

  // 채팅 보내기 (유저/의사)
  public function send(Request $request)
  {
    if($request['id_type'] == "doctor"){
      // <의사> 이용 정지 회원인지 확인
      check_time('doctor',$request->send_id);
      $q = doctor_check($request->send_id);
      if(isset($q)){
        return $q;
      }
    }else{
      // <고객> 이용 정지 회원인지 확인
      check_time('user',$request->send_id);
      $q = user_check($request->send_id);
      if(isset($q)){
        return $q;
      }
    }

    $channel_id = "GJCIaUNfqtlHkHrF";

    $url = "https://api2.scaledrone.com/".$channel_id."/".$request['chat_room']."/publish";
    // $url = "https://api2.scaledrone.com/".$channel_id."/1/publish";

    // $json = json_encode($body);
    $headers = array();
    $headers[] = 'Content-Type: application/json';

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"POST");
    // curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
    curl_setopt($ch, CURLOPT_HTTPHEADER,$headers);

    if($request['state'] != "on"){
      //채팅 종료시
      $body = array('state' => "off");
      $json = json_encode($body);
      curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
      //Send the request
      $response = curl_exec($ch);

      if ($response === false) {
        return response()->json([
          "result" => false,
        ]);
      }
      //Close request
      curl_close($ch);

      $chat_request = \App\chat_request::where('id',$request['chat_request_id'])->update(['state' => "finish"]);

      $chat_request = \App\chat_request::where('id',$request['chat_request_id'])->first();

      // 포인트 적립
      $price = config('app.price');

      $accumulate = \App\accumulate::create([
        "doctor_id" => $chat_request->doctor_id,
        "chat_request_id" => $request['chat_request_id'],
        "point" => $price,
      ]);

      //-------------------fcm 발송
      $user_a = \App\user_info::where('id',$chat_request->user_id)->first();
      $doctor_a = \App\doctor_info::where('id',$chat_request->doctor_id)->first();
      $token = $user_a->fcm_token;

      //notification 부분
      $title = "아직 평점을 못 준 상담이 있습니다.";
      $body_a = "클릭해서 확인해주세요.";


      //data 부분
      $channel = "1";
      $data = array('chat_request_id' => $request['chat_request_id'], 'doctor_id' => $doctor_a->id, 'doctor_name' => $doctor_a->doctor_name, "android_channel_id" => $channel);
      // $data = array('chat_request_id' => $chat_request->id, 'type' => "0", "title" => $title, "body" => $body);

      $type = "user";
      //발송
      $response = fcm($title,$body_a,$data,$token,$type,$channel);

      // 평점 4.0 이상 , 채팅횟수 100회 이상시 수수료 등급 조정
      // $chat_count = \App\chat_request::where([['doctor_id',$chat_request->doctor_id],['state','finish']])->count();
      // $rating = \App\chat_request::where([['doctor_id',$chat_request->doctor_id],['state','finish'],['rating','<>',"0.0"]])->avg('rating');
      //
      // if($chat_count >= "100" && $rating >= "4.0"){
      //   $fee = \App\doctor_info::where('id',$chat_request->doctor_id)->update([
      //     "fee" => "20"
      //   ]);
      // }

      return response()->json([
        "result" => true,
      ]);

    }else{
      //이미지 처리
      if($request['message_type'] == "img"){
        //채팅방 이미지용 폴더 있는지 확인
        $file_check = Storage::disk('chat')->exists($request['chat_room']);
        //없을 경우 생성
        if(!$file_check){
          Storage::makeDirectory("public/img/chat/".$request['chat_room']);
          File::chmod("storage/img/chat/".$request['chat_room'],0777);
        }
        //이미지 저장
        $file_name = $request['message'];
        //이미지 중복확인
        $is_file_exist = file_exists("storage/img/chat/".$request['chat_room']."/".$file_name);
        while($is_file_exist){
          $file_name = $request['message'];
          $randomNum = mt_rand(1, 99);
          $file_name = "(".$randomNum.")".$file_name;
          $is_file_exist = file_exists("storage/img/chat/".$request['chat_room']."/".$file_name);
        }
        file_put_contents("storage/img/chat/".$request['chat_room']."/".$file_name, base64_decode($request['file_encode']));
        $msg = "http://ccit2019.cafe24.com/storage/img/chat/".$request['chat_room']."/".$file_name;
      //비디오처리
      }elseif ($request['message_type'] == "video") {
        //채팅방 비디오용 폴더 있는지 확인
        $file_check = Storage::disk('chat_video')->exists($request['chat_room']);
        //없을 경우 생성
        if(!$file_check){
          Storage::makeDirectory("public/video/chat/".$request['chat_room']);
          File::chmod("storage/video/chat/".$request['chat_room'],0777);
        }
        //이미지 저장
        $file_name = $request['message'];
        //이미지 중복확인
        $is_file_exist = file_exists("storage/video/chat/".$request['chat_room']."/".$file_name);
        while($is_file_exist){
          $file_name = $request['message'];
          $randomNum = mt_rand(1, 99);
          $file_name = "(".$randomNum.")".$file_name;
          $is_file_exist = file_exists("storage/video/chat/".$request['chat_room']."/".$file_name);
        }
        file_put_contents("storage/video/chat/".$request['chat_room']."/".$file_name, base64_decode($request['file_encode']));
        $msg = "http://ccit2019.cafe24.com/storage/video/chat/".$request['chat_room']."/".$file_name;
      // 텍스트 처리
      }else{
        $msg = $request['message'];
      }
    }

    if($request['id_type'] == "doctor"){
      $doctor = \App\doctor_info::where('id',$request['send_id'])->first();
      $send_id = $doctor->doctor_name;
    }else{
      $user = \App\user_info::where('id',$request['send_id'])->first();
      $send_id = $user->user_nick;
    }
    //메시지 보내기
    $body = array(
      'id_type' => $request['id_type'],
      'send_id' => $send_id,
      'message_type' => $request['message_type'],
      'message' => $msg,
      'time' => date("Y-m-d H:i"),
      'state' => $request['state'],
    );

    $json = json_encode($body);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $json);

    //Send the request
    $response = curl_exec($ch);

    if ($response === false) {
      return response()->json([
        "result" => false,
      ]);
    }
    //Close request
    curl_close($ch);

    // fcm 알림 전송
    // 사용자가 방에 있는지 확인
    $url = "https://api2.scaledrone.com/GJCIaUNfqtlHkHrF/".$request['chat_room']."/members";
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST,"GET");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);

    //Send the request
    if(curl_exec($ch) != "[]"){
      $response = curl_exec($ch);
      $count = substr_count($response, ',') + 1;
    }else{
      $count = "0";
    }
    //Close request
    curl_close($ch);

    //알림 전송 부분
    if($count == "1"){
      $chat = \App\chat_request::where('id',$request['chat_request_id'])->first();
      if($request->id_type == "doctor"){
        $user = \App\user_info::where('id',$chat->user_id)->first();
        $token = $user->fcm_token;
      }else{
        $doctor = \App\doctor_info::where('id',$chat->doctor_id)->first();
        $token = $doctor->fcm_token;
      }

      $pet = \App\pet_info::where("id",$request['chat_room'])->first();

      //notification 부분
      $title = $send_id;
      $body = $msg;
      //data 부분
      $channel = "2";
      $data = array('chat_request_id' => $request['chat_request_id'], 'chat_room' => $request['chat_room'], 'pet_name' => $pet->pet_name, "android_channel_id" => $channel);
      // $data = array('chat_request_id' => $chat_request->id, 'type' => "0", "title" => $title, "body" => $body);

      $type = "user";
      //발송
      $response = fcm($title,$body,$data,$token,$type,$channel);
      // $response = fcm($data,$token,$type);

      if(isset($token)){
        if($request->id_type == "doctor"){
          $log = \App\fcm_log::create([
            'id_type' => 'user',
            'fcm_id' => $user->id,
            'type' => "채팅 메시지",
            'ip_address' => $_SERVER["REMOTE_ADDR"],
          ]);
        }else{
          $log = \App\fcm_log::create([
            'id_type' => 'doctor',
            'fcm_id' => $doctor->id,
            'type' => "채팅 메시지",
            'ip_address' => $_SERVER["REMOTE_ADDR"],
          ]);
        }
      }
    }

    if($request['id_type'] == "user"){
      $chat = \App\chat::create([
        'request_id' => $request['chat_request_id'],
        'id_type' => $request['id_type'],
        'send_user' => $request['send_id'],
        'room' => $request['chat_room'],
        'message_type' => $request['message_type'],
        'message' => $msg,
      ]);
    }else{
      $chat = \App\chat::create([
        'request_id' => $request['chat_request_id'],
        'id_type' => $request['id_type'],
        'send_doctor' => $request['send_id'],
        'room' => $request['chat_room'],
        'message_type' => $request['message_type'],
        'message' => $msg,
      ]);
    }

    if (isset($chat->id)) {
      return response()->json([
        "result" => true,
      ]);
    }else{
      return response()->json([
        "result" => false,
      ]);
    }
  }

  //채팅 추가시간 설정
  public function add_time(Request $request)
  {
    $time_check = \App\chat_request::where([['state','ing'],['doctor_id',$request->doctor_id],['id',$request->chat_request_id]])->first();
    if (!isset($time_check)) {
      return response()->json([
        "result" => false,
        "message" => '이미 종료된 채팅입니다.',
      ]);
    }else{
      $time_10 = date("Y-m-d H:i:s", strtotime($time_check->created_at."+10 minutes"));
      $now = date("Y-m-d H:i:s");
      if($time_check->extra_time != null) {
        return response()->json([
          "result" => false,
          "message" => '이미 연장하셨습니다.',
        ]);
      }elseif ($now < $time_10) {
        return response()->json([
          "result" => false,
          "message" => '아직 10분이 지나지 않았습니다.',
        ]);
      }else {
        $time_add = \App\chat_request::where([['state','ing'],['doctor_id',$request->doctor_id],['id',$request->chat_request_id]])->update(['extra_time' => $request->extra_time]);
        return response()->json([
          "result" => true,
        ]);
      }
    }
  }
}

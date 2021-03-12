<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ConfigController extends Controller
{
  //로그인만 이용가능한 컨트롤러
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('checkstatus');
  }

  /*FCM 발송페이지*/
  public function fcm()
  {
    return view('config.fcm');
  }
    /*FCM 발송*/
  public function fcm_send(Request $request)
  {
    $this->validate($request,[
      'type' => 'required',
      'title' => 'required',
      'body' => 'required'
    ]);

    $token = array();
    if($request->type == "all"){
      $users = \App\user_info::where('on/off','on')->get();
      $doctors= \App\doctor_info::where([['approval','complete'],['on/off','on']])->get();

      foreach ($users as $user) {
        if($user->fcm_token != null){
          $log = \App\fcm_log::create([
            'id_type' => 'user',
            'fcm_id' => $user->id,
            'type' => "관리자 단체 발송",
            'ip_address' => $_SERVER["REMOTE_ADDR"],
          ]);
          array_push($token, $user->fcm_token);
        }
      }
      foreach ($doctors as $doctor) {
        if($doctor->fcm_token != null){
          $log = \App\fcm_log::create([
            'id_type' => 'doctor',
            'fcm_id' => $doctor->id,
            'type' => "관리자 단체 발송",
            'ip_address' => $_SERVER["REMOTE_ADDR"],
          ]);
          array_push($token, $doctor->fcm_token);
        }
      }
    }elseif($request->type == "user"){
      if(isset($request->payment)) {
        $users = \App\payment_list::join('user_info','payment_list.user_id','=','user_info.id')->select('user_info.id', 'user_info.fcm_token', DB::raw("count(payment_list.id) as count"))->where([['on/off','on'],['payment_list.state','complete']])->groupBy('user_info.id')->having('count','>=',$request->payment)->get();
      }else {
        $users = \App\user_info::where('on/off','on')->get();
      }
      foreach ($users as $user) {
        if($user->fcm_token != null){
          $log = \App\fcm_log::create([
            'id_type' => 'user',
            'fcm_id' => $user->id,
            'type' => "관리자 단체 발송",
            'ip_address' => $_SERVER["REMOTE_ADDR"],
          ]);
          array_push($token, $user->fcm_token);
        }
      }
    }else{
      if(isset($request->rating) and isset($request->count) and $request->sido != '0' and $request->gugun != '0') {
        $address = $request->sido." ".$request->gugun;
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')->join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("avg(rating) as rating"), DB::raw("count(chat_request.id) as count"), DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('rating','>=',$request->rating)->having('count','>=',$request->count)->having('hospital_info.address','like',"%".$address."%")->get();
      }
      elseif(isset($request->rating) and isset($request->count) and $request->sido != '0' and $request->gugun == '0') {
        $address = $request->sido;
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')->join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("avg(rating) as rating"), DB::raw("count(chat_request.id) as count"), DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('rating','>=',$request->rating)->having('count','>=',$request->count)->having('hospital_info.address','like',"%".$address."%")->get();
      }
      elseif(isset($request->rating) and isset($request->count) and $request->sido == '0' and $request->gugun != '0') {
        $address = $request->gugun;
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')->join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("avg(rating) as rating"), DB::raw("count(chat_request.id) as count"), DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('rating','>=',$request->rating)->having('count','>=',$request->count)->having('hospital_info.address','like',"%".$address."%")->get();
      }
      elseif(isset($request->rating) and isset($request->count) and $request->sido == '0' and $request->gugun == '0') {
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("avg(rating) as rating"), DB::raw("count(chat_request.id) as count"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('rating','>=',$request->rating)->having('count','>=',$request->count)->get();
      }
      elseif(isset($request->rating) and $request->sido != '0' and $request->gugun != '0') {
        $address = $request->sido." ".$request->gugun;
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')->join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("avg(rating) as rating"), DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('rating','>=',$request->rating)->having('hospital_info.address','like',"%".$address."%")->get();
      }
      elseif(isset($request->rating) and $request->sido != '0' and $request->gugun == '0') {
        $address = $request->sido;
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')->join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("avg(rating) as rating"), DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('rating','>=',$request->rating)->having('hospital_info.address','like',"%".$address."%")->get();
      }
      elseif(isset($request->rating) and $request->sido == '0' and $request->gugun != '0') {
        $address = $request->gugun;
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')->join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("avg(rating) as rating"), DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('rating','>=',$request->rating)->having('hospital_info.address','like',"%".$address."%")->get();
      }
      elseif(isset($request->rating) and $request->sido == '0' and $request->gugun == '0') {
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("avg(rating) as rating"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('rating','>=',$request->rating)->get();
      }
      elseif(isset($request->count) and $request->sido != '0' and $request->gugun != '0') {
        $address = $request->sido." ".$request->gugun;
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')->join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("count(chat_request.id) as count"), DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having([['count','>=',$request->count],['hospital_info.address','like',"%".$address."%"]])->get();
      }
      elseif(isset($request->count) and $request->sido != '0' and $request->gugun == '0') {
        $address = $request->sido;
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')->join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("count(chat_request.id) as count"), DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('count','>=',$request->count)->having('hospital_info.address','like',"%".$address."%")->get();
      }
      elseif(isset($request->count) and $request->sido == '0' and $request->gugun != '0') {
        $address = $request->gugun;
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')->join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("count(chat_request.id) as count"), DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('count','>=',$request->count)->having('hospital_info.address','like',"%".$address."%")->get();
      }
      elseif(isset($request->count) and $request->sido == '0' and $request->gugun == '0') {
        $doctors = \App\chat_request::join('doctor_info','chat_request.doctor_id','=','doctor_info.id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("count(chat_request.id) as count"))
        ->where([['approval','complete'],['on/off','on'],['chat_request.state','finish']])->groupBy('doctor_info.id')
        ->having('count','>=',$request->count)->get();
      }
      elseif($request->sido != "0" && $request->gugun != "0") {
        $address = $request->sido." ".$request->gugun;
        $doctors = \App\doctor_info::join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on']])->groupBy('doctor_info.id')
        ->having('hospital_info.address','like',"%".$address."%")->get();
      }
      elseif($request->sido != "0" && $request->gugun == "0") {
        $address = $request->sido;
        $doctors = \App\doctor_info::join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on']])->groupBy('doctor_info.id')
        ->having('hospital_info.address','like',"%".$address."%")->get();
      }elseif($request->sido == "0" && $request->gugun != "0") {
        $address = $request->gugun;
        $doctors = \App\doctor_info::join('hospital_info','doctor_info.id','=','hospital_info.doctor_id')
        ->select('doctor_info.id', 'doctor_info.fcm_token', DB::raw("hospital_info.address"))
        ->where([['approval','complete'],['on/off','on']])->groupBy('doctor_info.id')
        ->having('hospital_info.address','like',"%".$address."%")->get();
      }else {
        $doctors = \App\doctor_info::where([['approval','complete'],['on/off','on']])->get();
      }


      foreach ($doctors as $doctor) {
        if($doctor->fcm_token != null){
          $log = \App\fcm_log::create([
            'id_type' => 'doctor',
            'fcm_id' => $doctor->id,
            'type' => "관리자 단체 발송",
            'ip_address' => $_SERVER["REMOTE_ADDR"],
          ]);
          array_push($token, $doctor->fcm_token);
        }
      }
    }
    $SERVER_KEY = "AAAAEoPJN6I:APA91bGXvocWzcIU-xYKXw5PovzaWMV05eS6_MuJGzR9NVmwiU6ZjnKZKTsKymq_s-voRFDmY5UjqvUylXe1awO4S-UYSekDvYeau6Wqsra2BTRrVDmHs8-ZKUri_rjqrdmkSgzXwt7j";

    $url = "https://fcm.googleapis.com/fcm/send";

    $notification = array('title' => $request->title , 'body' => $request->body, 'sound' => 'default', 'badge' => '1', 'click_action' => '.MainActivity', 'android_channel_id' => '0');

    $data = array('android_channel_id' => "0");
    $arrayToSend = array('registration_ids' => $token, 'notification' => $notification, 'data' => $data, 'priority' => 'high');

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

    return redirect()->back()->with('alert','FCM이 성공적으로 발송되었습니다.');
  }

  // /*무통장 입금 계좌 목록*/
  // public function passbook()
  // {
  //   $passbooks = \App\passbook_account::where('on/off','off')->get();
  //   return view('config.passbook_config',compact('passbooks'));
  // }
  //
  // /*무통장 입금 계좌 등록 */
  // public function passbook_register_success(Request $request)
  // {
  //   $this->validate($request,[
  //     'bank_name' => 'required',
  //     'bank_number' => 'required|min:11|max:14',
  //     'bank_depo' => 'required'
  //   ]);
  //
  //   $product = \App\passbook_account::where('id',$request->passbook_id)->insert([
  //     'bank_name' => $request->bank_name,
  //     'bank_number' => $request->bank_number,
  //     'bank_depo' => $request->bank_depo
  //   ]);
  //   return redirect("config/passbook")->with('alert',"등록 되었습니다.");
  // }
  //
  // /*무통장 입금 계좌 등록 변경*/
  // public function passbook_update(Request $request)
  // {
  //   $passbook = \App\passbook_account::where('on/off',"on")->update(['on/off' => "off"]);
  //
  //   $passbook = \App\passbook_account::where('id',$request->passbook_id)->update(['on/off' => 'on']);
  //   return redirect("config/passbook")->with('alert',"변경 되었습니다.");
  // }
  //
  // /*무통장 입금 계좌 삭제*/
  // public function passbook_delete(Request $request)
  // {
  //   $passbook = \App\passbook_account::where('id',$request->passbook_delete_id)->delete();
  //   return redirect("config/passbook")->with('alert',"삭제 되었습니다.");
  // }
}

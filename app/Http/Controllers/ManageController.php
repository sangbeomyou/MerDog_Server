<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class ManageController extends Controller
{
  //로그인만 이용가능한 컨트롤러
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('checkstatus');
    $this->middleware('normal')->only([
      //회원관리
      'admin_create','admin_pw','admin_level','doctor_fee','doctor_detail_fee','doctor_stop','user_stop','user_ticket','user_detail_ticket',
      //승인대기
      'wait_admin_create','wait_admin_update','wait_doctor_create','wait_doctor_update', 'wait_doctor_delete',
      //결제관리
      'refund','refund_update','refund_delete','withdraw_request','withdraw_request_accept','withdraw_request_deny',
      //상품관리
      'product_state','product_register','product_register_success'
    ]);
    $this->middleware('manager')->only([
      //회원관리
      'doctor_fee','doctor_detail_fee','doctor_stop','user_stop',
      //결제관리
      'refund_update','refund_delete','withdraw_request_accept','withdraw_request_deny',
    ]);

    function fcm($title,$body,$data,$token,$channel_id){
      $SERVER_KEY = "AAAAEoPJN6I:APA91bGXvocWzcIU-xYKXw5PovzaWMV05eS6_MuJGzR9NVmwiU6ZjnKZKTsKymq_s-voRFDmY5UjqvUylXe1awO4S-UYSekDvYeau6Wqsra2BTRrVDmHs8-ZKUri_rjqrdmkSgzXwt7j";

      $url = "https://fcm.googleapis.com/fcm/send";

      $notification = array('title' => $title , 'body' => $body, 'sound' => 'default', 'badge' => '1', 'click_action' => '.MainActivity', 'android_channel_id' => $channel_id);

      $arrayToSend = array('to' => $token, 'notification' => $notification, 'data' => $data, 'priority' => 'high');

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

      //Close request
      curl_close($ch);

      return $response;
    }

    function sms($phone,$msg,$log_type){
      //전화번호 형식
      $recv = preg_replace("/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/", "$1-$2-$3", $phone);

      $sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // HTTPS 전송요청 URL
      $sms['user_id'] = base64_encode("ccitsms"); //SMS 아이디.
      $sms['secure'] = base64_encode("1cc4bc9ea5d24c9811d2cf30d430276f") ;//인증키
      $sms['msg'] = base64_encode(stripslashes($msg));
      $sms['rphone'] = base64_encode($recv);  // 수신번호

      $sms['sphone1'] = base64_encode('010');  // 발신번호
      $sms['sphone2'] = base64_encode('7375');
      $sms['sphone3'] = base64_encode('6544');
      $sms['mode'] = base64_encode("1"); // base64 사용시 반드시 모드값을 1로 주셔야 합니다.

      $host_info = explode("/", $sms_url);
      $host = $host_info[2];
      $path = $host_info[3];

      srand((double)microtime()*1000000);
      $boundary = "---------------------".substr(md5(rand(0,32000)),0,10);

      // 헤더 생성
      $header = "POST /".$path ." HTTP/1.0\r\n";
      $header .= "Host: ".$host."\r\n";
      $header .= "Content-type: multipart/form-data, boundary=".$boundary."\r\n";

      // 본문 생성
      $data = "";
      foreach($sms AS $index => $value){
          $data .="--$boundary\r\n";
          $data .= "Content-Disposition: form-data; name=\"".$index."\"\r\n";
          $data .= "\r\n".$value."\r\n";
          $data .="--$boundary\r\n";
      }
      $header .= "Content-length: " . strlen($data) . "\r\n\r\n";

      $fp = fsockopen($host, 80);

      if ($fp) {
        fputs($fp, $header.$data);
        $rsp = '';
        while(!feof($fp)) {
            $rsp .= fgets($fp,8192);
        }
        fclose($fp);
        $msg = explode("\r\n\r\n",trim($rsp));
        $rMsg = explode(",", $msg[1]);
        $RESULT= $rMsg[0]; //발송결과
        $Count= $rMsg[1]; //잔여건수

        //발송결과 알림
        if($RESULT=="success") {
          $result = true;
          $log = \App\sms_log::create([
            'phone' => $phone,
            'type' => $log_type,
            'ip_address' => $_SERVER["REMOTE_ADDR"],
          ]);
        }else{
          $result = false;
        }
      }else {
        $result = false;
      }
      return $result;
    }
  }
  //회원관리
  /*관리자 목록*/
  public function admin_create()
  {
    $admins = \App\admin_info::where('level','<>','1')->get();
    return view('manage.admin',compact('admins'));
  }
  /*관리자 비밀번호 재설정*/
  public function admin_pw(Request $request)
  {
    $this->validate($request,[
      'admin_pw' => 'required|max:15|min:5|confirmed|regex:/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*])[a-zA-Z0-9~!@#$%^&*]{5,15}$/',
    ]);
    $user = \App\admin_info::where('id',$request->user_num)->update(['admin_pw' => bcrypt($request->input('admin_pw'))]);
    return redirect()->back()->with('alert','비밀번호가 재설정 되었습니다.');
  }
  /*관리자 직급 변경*/
  public function admin_level(Request $request)
  {
    if($request->level == "4"){
      if(auth()->user()->level != "4"){
        return redirect()->back()->with('alert','해당 직급으로 변경 할 권한이 없습니다.');
      }
    }
    $user = \App\admin_info::where('id',$request->user_num)->update(['level' => $request->input('level')]);
    return redirect()->back()->with('alert','직급이 변경되었습니다.');
  }

  /*의사 목록*/
  public function doctor_create()
  {
    $doctors = \App\doctor_info::where([['approval','complete'],['on/off','on']])->get();
    return view('manage.doctor',compact('doctors'));
  }

  /*의사 정지 회원 목록*/
  public function stop_doctor()
  {
    $doctors = \App\doctor_info::where('on/off','off')->get();
    return view('manage.stop_doctor',compact('doctors'));
  }

  /*의사 전체 수수료 조정*/
  public function doctor_fee(Request $request)
  {
    if($request->type == "all"){
      $this->validate($request,[
        'fee' => 'required|max:100|min:1|numeric',
      ]);
      $fee = \App\doctor_info::where([['approval','complete'],['on/off','on']])->update(['fee' => $request->fee]);
    }elseif($request->type == "count"){
      $this->validate($request,[
        'count' => 'required|min:1',
        'fee' => 'required|max:100|min:1',
      ]);
      $lists = \App\chat_request::select('doctor_id', DB::raw("count(id) as count"))->where('state','finish')->groupBy('doctor_id')->get();
      foreach ($lists as $list) {
        if($list->count >= $request->count){
          $doctor = \App\doctor_info::where('id',$list->doctor_id)->first();
          if($doctor->state != "0" && $doctor['on/off'] != "off"){
            $fee = \App\doctor_info::where('id', $list->doctor_id)->update(['fee' => $request->fee]);
          }
        }
      }
    }elseif($request->type == "rating"){
      $this->validate($request,[
        'rating' => 'required|between:0.1,5.0',
        'fee' => 'required|max:100|min:1',
      ]);
      $lists = \App\chat_request::select('doctor_id', DB::raw("avg(rating) as rating"))->where([['state','finish'],['rating','<>', NULL]])->groupBy('doctor_id')->get();
      foreach ($lists as $list) {
        if($list->rating >= $request->rating){
          $doctor = \App\doctor_info::where('id',$list->doctor_id)->first();
          if($doctor->state != "0" && $doctor['on/off'] != "off"){
            $fee = \App\doctor_info::where('id', $list->doctor_id)->update(['fee' => $request->fee]);
          }
        }
      }
    }elseif($request->type == "both"){
      $this->validate($request,[
        'count' => 'required|min:1',
        'rating' => 'required|between:0.1,5.0',
        'fee' => 'required|max:100|min:1',
      ]);
      $lists = \App\chat_request::select('doctor_id', DB::raw("count(id) as count"))->where('state','finish')->groupBy('doctor_id')->get();
      foreach ($lists as $list) {
        if($list->count >= $request->count){
          $doctor = \App\doctor_info::where('id',$list->doctor_id)->first();
          if($doctor->state != "0" && $doctor['on/off'] != "off"){
            $rating = \App\chat_request::where([['doctor_id',$list->doctor_id],['state','finish'],['rating','<>',NULL]])->avg('rating');
            if($rating >= $request->rating){
              $fee = \App\doctor_info::where('id', $list->doctor_id)->update(['fee' => $request->fee]);
            }
          }
        }
      }
    }
    return redirect()->back()->with('alert', '적용되었습니다.');
  }

  /*의사 상세*/
  public function doctor_detail($id)
  {
    $doctor = \App\doctor_info::where('id',$id)->first();
    return view('manage.detail_doctor',compact('doctor'));
  }

  /*의사 상세 FCM 발송*/
  public function doctor_detail_fcm(Request $request)
  {
    $this->validate($request,[
      'doctor_id' => 'required',
      'title' => 'required',
      'body' => 'required',
    ]);
    $doctor = \App\doctor_info::where('id',$request->doctor_id)->first();
    $data = array("notice"=>"notice");
    $token = $doctor->fcm_token;
    fcm($request->title,$request->body,$data,$token,"0");
    if($token != null){
      $log = \App\fcm_log::create([
        'id_type' => 'doctor',
        'fcm_id' => $doctor->id,
        'type' => "관리자 발송",
        'ip_address' => $_SERVER["REMOTE_ADDR"],
      ]);
      return redirect()->back()->with('alert', 'FCM이 발송 되었습니다.');
    }else{
      return redirect()->back()->with('alert', '로그아웃 상태입니다.');
    }
  }

  /*의사 상세 수수료 조정*/
  public function doctor_detail_fee(Request $request)
  {
    $doctor = \App\doctor_info::where('id',$request['doctor_id'])->update(['fee'=> $request->fee,]);
    return redirect()->back()->with('alert', '적용되었습니다.');
  }

  /*의사 상세 -> 회원 일시정지*/
  public function doctor_stop(Request $request)
  {
    $doctor = \App\doctor_info::where('id',$request['doctor_id'])->update([
      'on/off'=> 'off',
      'state'=> 'off',
      'fcm_token'=> NULL,
      'address'=> NULL,
      'latitude'=> NULL,
      'longitude'=> NULL,
      'doctor_token' => NULL,
    ]);
    return redirect('manage/doctor');
  }

  /*회원 목록*/
  public function user_create()
  {
    $users = \App\user_info::where('on/off','on')->get();
    return view('manage.user',compact('users'));
  }

  /*정지 회원 목록*/
  public function stop_user()
  {
    $users = \App\user_info::where('on/off','off')->get();
    return view('manage.stop_user',compact('users'));
  }

  /*회원 이용권 지급*/
  public function user_ticket(Request $request)
  {
    $this->validate($request,[
      'ticket' => 'required',
    ]);
    $users = \App\user_info::whereIn('id',$request->user_id)->get();
    foreach ($users as $user) {
      $ticket = \App\user_info::where('id',$user->id)->first();
      $ticket = \App\user_info::where('id',$user->id)->update(['ticket' => $ticket->ticket + $request->ticket]);
    }
    return redirect()->back()->with('alert', '이용권 지급이 완료되었습니다.');
  }

  /*회원 상세*/
  public function user_detail($id)
  {
    $user = \App\user_info::where('id',$id)->first();
    return view('manage.detail_user',compact('user'));
  }

  /*회원 상세 FCM 발송*/
  public function user_detail_fcm(Request $request)
  {
    $this->validate($request,[
      'user_id' => 'required',
      'title' => 'required',
      'body' => 'required',
    ]);
    $user = \App\user_info::where('id',$request->user_id)->first();
    $data = array("notice"=>"notice",'android_channel_id'=> '0');
    $token = $user->fcm_token;
    fcm($request->title,$request->body,$data,$token,"0");
    if($token != null){
      $log = \App\fcm_log::create([
        'id_type' => 'user',
        'fcm_id' => $user->id,
        'type' => "관리자 발송",
        'ip_address' => $_SERVER["REMOTE_ADDR"],
      ]);
      return redirect()->back()->with('alert', 'FCM이 발송 되었습니다.');
    }else{
      return redirect()->back()->with('alert', '로그아웃 상태입니다.');
    }
  }

  /*회원 상세 이용권 지급*/
  public function user_detail_ticket(Request $request)
  {
    $ticket = \App\user_info::where('id',$request['user_id_ticket'])->first();
    $user = \App\user_info::where('id',$request['user_id_ticket'])->update(['ticket' => $ticket->ticket + $request->ticket]);
    return redirect()->back()->with('alert', '적용되었습니다.');
  }

  /*회원 상세 -> 회원 일시정지*/
  public function user_stop(Request $request)
  {
    $user = \App\user_info::where('id',$request['user_id'])->update([
      'on/off' => "off",
      'fcm_token' => NULL,
      'user_token' => NULL,
    ]);
    $pet = \App\pet_info::where('user_id',$request['id'])->update(['on/off' => "off"]);
    return redirect('manage/user');
  }

  //승인대기

  /*승인대기 - 관리자 창*/
  public function wait_admin_create()
  {
    $admins = \App\admin_info::where('level','1')->get();
    return view('manage.wait_admin',compact('admins'));
  }
  /*승인대기 - 관리자 승인 창*/
  public function wait_admin_update(Request $request)
  {
    $admins = \App\admin_info::where('id',$request->id)->update(['level' => '2']);
    return redirect()->back()->with('alert', '승인되었습니다');
  }
  /*승인대기 - 관리자 승인거부 창*/
  public function wait_admin_delete(Request $request)
  {
    $admins = \App\admin_info::where('id',$request->id)->delete();
    return redirect()->back()->with('alert', '거부되었습니다.');
  }

  /*승인대기 - 의사 창*/
  public function wait_doctor_create()
  {
    $doctors = \App\doctor_info::where('approval','wait')->get();
    return view('manage.wait_doctor',compact('doctors'));
  }
  /*승인대기 - 의사 승인 창*/
  public function wait_doctor_update(Request $request)
  {
    $doctors = \App\doctor_info::where('id',$request->id)->update(['approval' => 'complete']);
    $doctors = \App\doctor_info::where('id',$request->id)->first();
    $msg = "[MerDog] 회원님의 회원가입이 승인 되었습니다.";
    $log_type = "가입 승인";
    sms($doctors->doctor_phone,$msg,$log_type);
    return redirect()->back()->with('alert', '승인되었습니다');
  }
  /*승인대기 - 의사 승인거부 창*/
  public function wait_doctor_delete(Request $request)
  {
    $doctors = \App\doctor_info::where('id',$request->id)->update(['approval' => 'deny']);
    $doctors = \App\doctor_info::where('id',$request->id)->first();
    $msg = "[MerDog] 회원님의 회원가입이 거부 되었습니다. 로그인 후 자격증 정보를 다시 입력해주세요.";
    $log_type = "가입 거부";
    sms($doctors->doctor_phone,$msg,$log_type);
    return redirect()->back()->with('alert', '거부되었습니다');
  }

  //상담관리

  /*상담 관리 목록 (채팅요청정보 목록)*/
  public function chat($id=null)
  {
    if(isset($id)){
      $id = explode("_",$id);
      $type = $id['0'];
      $id = $id['1'];
      if($type == "user"){
        $chat_requests = \App\chat_request::where('user_id',$id)->whereIn('state',['ing','finish'])->get();
      }elseif($type == "doctor") {
        $chat_requests = \App\chat_request::where('doctor_id',$id)->whereIn('state',['ing','finish'])->get();
      }else {
        $chat_requests = \App\chat_request::whereIn('state',['ing','finish'])->get();
      }
      return view('manage.chat',compact('chat_requests'))->with('id',$id)->with('type',$type);
    }else{
      $chat_requests = \App\chat_request::whereIn('state',['ing','finish'])->get();
      return view('manage.chat',compact('chat_requests'));
    }
  }
  /* 상담상세내역 */
  public function chat_detail($id)
  {
    $chat_detail = \App\chat_request::where('id',$id)->first();
    return view('manage.detail_chat',compact('chat_detail'));
  }
  /* 채팅방 채팅상세 전체내역 */
  public function room_chat_detail($id)
  {
    $room_chat_details = \App\chat_request::where('pet_id', $id)->whereIn('state',['ing','finish'])->get();
    // $payments = \App\payment_list::where([['state','<>','wait'],['user_id',$id]])->get();
    return view('manage.chat_manage.room_chat_detail',compact('room_chat_details'))->with('id',$id);
  }
  /* 일반회원 채팅목록(회원별 상담) */
  public function user_chat()
  {
    $user_list = \App\chat_request::select('user_id')->whereIn('state',['ing','finish'])->distinct()->get();
    $user_chats = \App\user_info::whereIn('id',$user_list)->get();
    return view('manage.chat_manage.user_chat',compact('user_chats'));
  }

  /* 일반회원 채팅상세 전체내역(회원별 상담) */
  public function user_chat_detail($id)
  {
    $user_chat_details = \App\chat_request::where('user_id',$id)->whereIn('state',['ing','finish'])->get();
    return view('manage.chat_manage.user_chat_detail',compact('user_chat_details'))->with('id',$id);
  }

  /* 의사회원 채팅목록(회원별 상담) */
  public function doctor_chat()
  {
    $doctor_list = \App\chat_request::select('doctor_id')->whereIn('state',['ing','finish'])->distinct()->get();
    $doctor_chats = \App\doctor_info::whereIn('id',$doctor_list)->get();
    return view('manage.chat_manage.doctor_chat',compact('doctor_chats'));
  }

  /* 의사회원 채팅상세 전체내역(회원별 상담) */
  public function doctor_chat_detail($id)
  {
    $doctor_chat_details = \App\chat_request::where('doctor_id',$id)->whereIn('state',['ing','finish'])->get();
    return view('manage.chat_manage.doctor_chat_detail',compact('doctor_chat_details'))->with('id',$id);
  }

  //결제관리
  /*결제 내역*/
  public function payment($id=null)
  {
    if(isset($id)){
      $payments = \App\payment_list::where([['state','<>','wait'],['user_id',$id]])->get();
      return view('manage.payment_manage.payment',compact('payments'))->with('id',$id);
    }else{
      $payments = \App\payment_list::where('state','<>','wait')->get();
      return view('manage.payment_manage.payment',compact('payments'));
    }
  }


  /*환불 신청 내역*/
  public function refund()
  {
    $user = \App\user_info::select('id')->where('on/off','on')->get();
    $refunds = \App\refund_list::where('state','wait')->whereIn('user_id',$user)->get();
    return view('manage.payment_manage.refund',compact('refunds'));
  }
  /*환불 신청 승인*/
  public function refund_update(Request $request)
  {
    $refunds = \App\refund_list::where('id',$request->refund_id)->update(['state' => 'complete']);
    $payment_list = \App\payment_list::where('id', $request->payment_id)->update(['state' => 'refund']);
    $user = \App\user_info::where('id', $request->user)->first();
    $users = \App\user_info::where('id', $request->user)->update(['ticket' => $user->ticket-$request->ticket]);
    return redirect()->back()->with('alert', '승인되었습니다.');
  }
  /*환불 신청 거절*/
  public function refund_delete(Request $request)
  {
    $refunds = \App\refund_list::where('id',$request->id)->update(['state' => 'deny','coment' => $request->coment]);
    $title = "환불 신청이 거부되었습니다.";
    $body = "환불 신청 내역을 확인해주세요.";
    $data = array('refund_id' => $request->id,'android_channel_id'=> '3');
    $user = \App\refund_list::where('id',$request->id)->first();
    $token = \App\user_info::select('fcm_token')->where('id',$user->user_id)->first();
    $token = $token->fcm_token;
    fcm($title,$body,$data,$token,"3");
    if(isset($token)){
      $log = \App\fcm_log::create([
        'id_type' => 'user',
        'fcm_id' => $user->user_id,
        'type' => "환불 신청 거절",
        'ip_address' => $_SERVER["REMOTE_ADDR"],
      ]);
    }
    return redirect()->back()->with('alert', '거절되었습니다.');
  }

  /*출금 내역*/
  public function withdraw($id=null)
  {
    if(isset($id)){
      $withdraws = \App\withdraw_list::where([['state','complete'],['doctor_id',$id]])->get();
      return view('manage.payment_manage.withdraw',compact('withdraws'))->with('id',$id);
    }else{
      $withdraws = \App\withdraw_list::where('state','complete')->get();
      return view('manage.payment_manage.withdraw',compact('withdraws'));
    }
  }

  /*출금 신청 내역*/
  public function withdraw_request()
  {
    $doctor = \App\doctor_info::select('id')->where([['on/off','on'],['approval','complete']])->get();
    $withdraw_requests = \App\withdraw_list::where('state','wait')->whereIn('doctor_id',$doctor)->get();
    return view('manage.payment_manage.withdraw_request',compact('withdraw_requests'));
  }

  /*출금 수락*/
  public function withdraw_request_accept(Request $request)
  {
    $withdraw = \App\withdraw_list::where('id', $request->id)->update(['state'=>'complete']);
    $title = "출금 신청이 승인되었습니다.";
    $body = "출금 신청 내역을 확인해주세요.";
    $data = array('withdraw_id' => $request->id,'android_channel_id'=> '3');
    $doctor = \App\withdraw_list::where('id',$request->id)->first();
    $token = \App\doctor_info::select('fcm_token')->where('id',$doctor->doctor_id)->first();
    $token = $token->fcm_token;
    fcm($title,$body,$data,$token,"3");
    if(isset($token)){
      $log = \App\fcm_log::create([
        'id_type' => 'doctor',
        'fcm_id' => $doctor->doctor_id,
        'type' => "출금 신청 수락",
        'ip_address' => $_SERVER["REMOTE_ADDR"],
      ]);
    }
    return redirect()->back()->with('alert', '완료되었습니다.');
  }

  /*출금 거절*/
  public function withdraw_request_deny(Request $request)
  {
    $withdraw = \App\withdraw_list::where('id', $request->id)->update(['state'=>'deny','coment' => $request->coment]);
    $title = "출금 신청이 거부되었습니다.";
    $body = "출금 신청 내역을 확인해주세요.";
    $data = array('withdraw_id' => $request->id,'android_channel_id'=> '0');
    $doctor = \App\withdraw_list::where('id',$request->id)->first();
    $token = \App\doctor_info::select('fcm_token')->where('id',$doctor->doctor_id)->first();
    $token = $token->fcm_token;
    fcm($title,$body,$data,$token,"3");
    if(isset($token)){
      $log = \App\fcm_log::create([
        'id_type' => 'doctor',
        'fcm_id' => $doctor->doctor_id,
        'type' => "출금 신청 거절",
        'ip_address' => $_SERVER["REMOTE_ADDR"],
      ]);
    }
    return redirect()->back()->with('alert', '거절되었습니다.');
  }


  //상품관리

  /*상품 내역*/
  public function product()
  {
    $products = \App\product::get();
    return view('manage.product_manage.product',compact('products'));
  }

  /*상품 상세내역*/
  public function product_detail($id)
  {
    $product = \App\product::where('id', $id)->first();
    return view('manage.product_manage.product_detail',compact('product'));
  }

  /*상품 수정*/
  public function product_update($id)
  {
    $product = \App\product::where('id', $id)->first();
    return view('manage.product_manage.product_update',compact('product'));
  }

  /*상품 수정 완료*/
  public function product_update_success(Request $request)
  {
    $this->validate($request,[
      'name' => 'required',
      'ticket' => 'required|min:0',
      'price' => 'required|min:0',
      'code' => 'required',
    ]);

    if($request->check =="2"){
      $this->validate($request,[
        'img' => 'mimes:jpeg,jpg,png,gif|required|max:10000',
      ]);

      $del_img = \App\product::where('id',$request->product_id)->first();
      $delete = File::delete("storage/img/product/".$del_img->img);
      // $delete = Storage::disk('license')->delete($del_img->);  // 파일 삭제

      $uploadedFile = $request->file('img'); // 파일 설정
      $filename = $uploadedFile->getClientOriginalName();  //파일 이름불러오기

      $is_file_exist = file_exists("storage/img/product/".$filename);
      while($is_file_exist){
        $filename = $uploadedFile->getClientOriginalName();
        $randomNum = mt_rand(1, 99);
        $filename = "(".$randomNum.")".$filename;
        $is_file_exist = file_exists("storage/img/product/".$filename);
      }

      $file = $uploadedFile ->storeAs('public/img/product',$filename);  //파일 이름($filename)으로 경로(public/img)에 저장

      $product = \App\product::where('id',$request->product_id)->update(['img' => $filename]);
    }

    $product = \App\product::where('id',$request->product_id)->update([
      'name' => $request->name,
      'ticket' => $request->ticket,
      'price' => $request->price,
      'product_code' => $request->code,
    ]);
    return redirect("manage/product")->with('alert','상품이 수정되었습니다.');
  }

  /*상품 상태 변경*/
  public function product_state(Request $request)
  {
    $product = \App\product::where('id',$request->product_id)->update([
      'on/off' => $request['on/off']
    ]);
    return redirect("manage/product");
  }

  /*상품 등록*/
  public function product_register()
  {
    return view('manage.product_manage.product_register');
  }

  /*상품 등록 완료*/
  public function product_register_success(Request $request)
  {
    $this->validate($request,[
      'name' => 'required',
      'ticket' => 'required|min:0',
      'price' => 'required|min:0',
      'code' => 'required',
      'img' => 'mimes:jpeg,jpg,png,gif|required|max:10000',
    ]);

    $uploadedFile = $request->file('img'); // 파일 설정
    $filename = $uploadedFile->getClientOriginalName();  //파일 이름불러오기

    $is_file_exist = file_exists("storage/img/product/".$filename);
    while($is_file_exist){
      $filename = $uploadedFile->getClientOriginalName();
      $randomNum = mt_rand(1, 99);
      $filename = "(".$randomNum.")".$filename;
      $is_file_exist = file_exists("storage/img/product/".$filename);
    }

    $file = $uploadedFile ->storeAs('public/img/product',$filename);  //파일 이름($filename)으로 경로(public/img)에 저장

    $product = \App\product::create([
      'name' => $request->name,
      'ticket' => $request->ticket,
      'price' => $request->price,
      'product_code' => $request->code,
      'img' => $filename,
    ]);
    return redirect("manage/product")->with('alert','상품이 등록되었습니다.');
  }
}

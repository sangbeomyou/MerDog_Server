<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class DoctorAppController extends Controller
{
  public function __construct()
  {
    // 이용 정지 회원인지 확인
    function check($id){
      $stop = \App\doctor_info::where('id',$id)->first();
      if($stop['on/off'] == 'off'){
        return response()->json([
          'result' => false
        ]);
      }
    }
  }

  /*의사 등록 (회원가입)*/
  public function register(Request $request)
  {
    $message = "";

    $check_doctor =  \App\license::where('img_name',$request['doctor_license_name'])->first();
    $check_user =  \App\license::where('img_name',$request['user_license_name'])->first();
    if(isset($check_doctor) && isset($check_user)){
      if(isset($check_doctor) && !isset($check_user)){
        $result = false;
        $message = $request['doctor_license_name']." 파일이 이름이 서버에 존재합니다. 다른 이름의 파일을 업로드 해주세요.";
      }elseif (!isset($check_doctor) && isset($check_user)) {
        $result = false;
        $message = $request['user_license_name']." 파일이 이름이 서버에 존재합니다. 다른 이름의 파일을 업로드 해주세요.";
      }
      $result = false;
      $message = $request['doctor_license_name']." , ".$request['user_license_name']." 파일이 이름이 서버에 존재합니다. 다른 이름의 파일을 업로드 해주세요.";
    }else{
      if($request['user_license_name'] == $request['doctor_license_name']){
        $result = false;
        $message = "서로 같은 이름의 파일을 업로드 할 수 없습니다.";
      }else{
        $insert_doctor = base64_decode($request['doctor_license']);   // 파일 디코딩
        $file_doctor = Storage::disk('license')->put($request['doctor_license_name'], $insert_doctor);  // 파일 저장

        $insert_user = base64_decode($request['user_license']);   // 파일 디코딩
        $file_user = Storage::disk('license')->put($request['user_license_name'], $insert_user);  // 파일 저장

        if($file_doctor && $file_user) {
          if($request->type == "kakao"){
            $create = \App\doctor_info::create([
              'doctor_kakao'=> $request->input('doctor_id'),
              'doctor_name'=> $request->input('doctor_name'),
              'doctor_phone'=> $request->input('doctor_phone'),
            ]);
          }elseif($request->type == "naver"){
            $create = \App\doctor_info::create([
              'doctor_naver'=> $request->input('doctor_id'),
              'doctor_name'=> $request->input('doctor_name'),
              'doctor_phone'=> $request->input('doctor_phone'),
            ]);
          }
          elseif($request->type == "google"){
            $create = \App\doctor_info::create([
              'doctor_google'=> $request->input('doctor_id'),
              'doctor_name'=> $request->input('doctor_name'),
              'doctor_phone'=> $request->input('doctor_phone'),
            ]);
          }
          elseif($request->type == "facebook"){
            $create = \App\doctor_info::create([
              'doctor_facebook'=> $request->input('doctor_id'),
              'doctor_name'=> $request->input('doctor_name'),
              'doctor_phone'=> $request->input('doctor_phone'),
            ]);
          }
          elseif($request->type == "twitter"){
            $create = \App\doctor_info::create([
              'doctor_twitter'=> $request->input('doctor_id'),
              'doctor_name'=> $request->input('doctor_name'),
              'doctor_phone'=> $request->input('doctor_phone'),
            ]);
          }else{
            $create = \App\doctor_info::create([
              'doctor_id'=> $request->input('doctor_id'),
              'doctor_pw'=> bcrypt($request->input('doctor_pw')),
              'doctor_name'=> $request->input('doctor_name'),
              'doctor_phone'=> $request->input('doctor_phone'),
            ]);
          }

          $doctor = \App\doctor_info::where('doctor_phone',$request->input('doctor_phone'))->first();
          $create_license_user = \App\license::create([
            'doctor_id' => $doctor->id,
            'img_name' => $request->input('user_license_name'),
            'division' => "user",
          ]);
          $create_license_doctor = \App\license::create([
            'doctor_id' => $doctor->id,
            'img_name' => $request->input('doctor_license_name'),
            'division' => "doctor",
          ]);
          $result = true;
        }else{
          $delete = Storage::disk('license')->delete([$request['doctor_license_name'], $request['user_license_name']]);  // 파일 삭제
          $result = false;
          $message = "서버 오류로 인해 파일 업로드에 실패했습니다. 잠시후 다시 시도해주세요.";
        }
      }
    }

    return response()->json([
      'result' => $result,
      'message' => $message,
    ]);
  }

  /*전화번호 중복확인*/
  public function check_phone(Request $request)
  {
    $doctor = \App\doctor_info::where('doctor_phone',$request['doctor_phone'])->first();
    if(isset($doctor->id)){
      $result = false;
    }else{
      $result = true;
    }
    return response()->json([
      'result' => $result,
    ]);
  }

  /*아이디 중복확인*/
  public function check_id(Request $request)
  {
    $doctor = \App\doctor_info::where('doctor_id',$request['doctor_id'])->first();
    if(isset($doctor->id)){
      $result = false;
    }else{
      $result = true;
    }
    return response()->json([
      'result' => $result,
    ]);
  }


  /*아아디 찾기*/
  public function find_id(Request $request)
  {
    $doctor = \App\doctor_info::where([['doctor_phone',$request['doctor_phone']],['doctor_name',$request['doctor_name']]])->first();
    if(isset($doctor->id)){
      return response()->json([
        'result' => true,
        'doctor_id' => $doctor->doctor_id,
        'doctor_kakao' => $doctor->doctor_kakao,
        'doctor_naver' => $doctor->doctor_naver,
        'doctor_google' => $doctor->doctor_google,
        'doctor_facebook' => $doctor->doctor_facebook,
        'doctor_twitter' => $doctor->doctor_twitter,
      ]);
    }else{
      return response()->json([
        'result' => false,  /// 아이디 없음
      ]);
    }
  }

  /*비밀번호 찾기*/
  public function find_pw(Request $request)
  {
    function Random($length) {
      $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*';
      $charactersLength = strlen($characters);
      $randomString = '';
      for ($i = 0; $i < $length; $i++) {
          $randomString .= $characters[rand(0, $charactersLength - 1)];
      }
      return $randomString;
    }

    $pw = Random(6);  /// 새로운 랜덤 pw 설정

    $doctor = \App\doctor_info::where([['doctor_id',$request['doctor_id']],['doctor_phone',$request['doctor_phone']]])->update(['doctor_pw' => bcrypt($pw)]);

    if($doctor != "0"){
      //전화번호 형식
      $recv = preg_replace("/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/", "$1-$2-$3", $request['doctor_phone']);
      $msg = "[MerDog] 회원님의 임시 비밀번호는 [".$pw."] 입니다.";

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
            'phone' => $request['doctor_phone'],
            'type' => "pw 변경",
            'ip_address' => $_SERVER["REMOTE_ADDR"],
          ]);
        }else{
          $result = false;
        }
      }else {
        $result = false;
      }
    }else{
      $result = false;
    }

    return response()->json([
      'result' => $result,
    ]);
  }

  /*거부 상태 자격증 정보 변경*/
  public function re_register(Request $request)
  {
    if(isset($request['doctor_license_name']) && isset($request['doctor_license']) && isset($request['user_license_name']) && isset($request['user_license']) && isset($request->doctor_id)){

      // 기존이미지 삭제
      $del_imgs = \App\license::where('doctor_id',$request->doctor_id)->get();
      $del_img_1 = $del_imgs[0]->img_name;
      $del_img_2 = $del_imgs[1]->img_name;
      $delete = Storage::disk('license')->delete([$del_img_1, $del_img_2]);  // 파일 삭제

      //자격증 이미지 중복확인 및 등록
      $doctor_img_name = $request['doctor_license_name'];

      $is_file_exist = file_exists("storage/img/license/".$doctor_img_name);
      while($is_file_exist){
        $doctor_img_name = $request['doctor_license_name'];
        $randomNum = mt_rand(1, 99);
        $doctor_img_name = "(".$randomNum.")".$doctor_img_name;
        $is_file_exist = file_exists("storage/img/license/".$doctor_img_name);
      }

      $insert_doctor = base64_decode($request['doctor_license']);   // 파일 디코딩
      $file_doctor = Storage::disk('license')->put($doctor_img_name, $insert_doctor);  // 파일 저장

      //신분증 이미지 중복확인 및 등록
      $user_img_name = $request['user_license_name'];

      $is_file_exist = file_exists("storage/img/license/".$user_img_name);
      while($is_file_exist){
        $user_img_name = $request['doctor_license_name'];
        $randomNum = mt_rand(1, 99);
        $user_img_name = "(".$randomNum.")".$user_img_name;
        $is_file_exist = file_exists("storage/img/license/".$user_img_name);
      }

      $insert_user = base64_decode($request['user_license']);   // 파일 디코딩
      $file_user = Storage::disk('license')->put($user_img_name, $insert_user);  // 파일 저장

      //db 처리

      if($file_doctor && $file_user) {
        $update_doctor = \App\doctor_info::where('id',$request->doctor_id)->update(['approval'=>'wait', 'created_at' => now()]);

        $create_license_user = \App\license::where([['doctor_id',$request->doctor_id],['division','user']])->update([
          'img_name' => $user_img_name,
        ]);
        $create_license_doctor = \App\license::where([['doctor_id',$request->doctor_id],['division','doctor']])->update([
          'img_name' => $doctor_img_name,
        ]);

        return response()->json([
          'result' => true,
        ]);
      }
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*의사 로그인*/
  public function login(Request $request)
  {
    function jwt($id,$random){
      // Create token header as a JSON string
      $header = json_encode(['typ' => 'JWT', 'alg' => 'HS256']);

      // Create token payload as a JSON string
      $payload = json_encode(['doctor_id' => $id]);

      // Encode Header to Base64Url String
      $base64UrlHeader = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($header));

      // Encode Payload to Base64Url String
      $base64UrlPayload = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($payload));

      // Create Signature Hash
      $signature = hash_hmac('sha256', $base64UrlHeader . "." . $base64UrlPayload, $random, true);

      // Encode Signature to Base64Url String
      $base64UrlSignature = str_replace(['+', '/', '='], ['-', '_', ''], base64_encode($signature));

      // Create JWT
      $jwt = $base64UrlHeader . "." . $base64UrlPayload . "." . $base64UrlSignature;

      return $jwt;
    }

    function Random($length) {
      $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$%^&*';
      $charactersLength = strlen($characters);
      $randomString = '';
      for ($i = 0; $i < $length; $i++) {
          $randomString .= $characters[rand(0, $charactersLength - 1)];
      }
      return $randomString;
    }

    $doctor_num = "";
    $token = "";


    if($request->type == "kakao"){
      $doctor = \App\doctor_info::where('doctor_kakao',$request['doctor_id'])->first();
      if(isset($doctor->id)){
        if($doctor->approval == "wait" && $doctor['on/off'] == "on"){
          $result = false;     /// 아직 인증 안됨
          $msg = "관리자의 승인을 기다리는 중 입니다.";
        }elseif($doctor->approval == "deny" && $doctor['on/off'] == "on"){
          $result = false;     /// 아직 인증 안됨
          $msg = "승인거부";
          $doctor_num = $doctor->id;
        }elseif ($doctor['on/off'] != "on") {
          $result = false;     /// 회원 정지
          $msg = "이용이 제한된 계정입니다.";
        }else{
          $token = jwt($doctor->id,Random(3));
          $fcm = \App\doctor_info::where('doctor_kakao',$request['doctor_id'])->update(["fcm_token" => $request['fcm_token'],'doctor_token'=> $token]);
          $log = \App\login_log::create([
            'id_type' => 'doctor',
            'login_id' => $doctor->id,
            'ip_address'=> $_SERVER["REMOTE_ADDR"]
          ]);
          $msg = "";
          $result = true;
          $doctor_num = $doctor->id;
        }
      }else{
        $result = false;  /// 카카오 id 없음
        $msg = "계정이 존재하지 않습니다.";
      }
    }elseif($request->type == "naver"){
      $doctor = \App\doctor_info::where('doctor_naver',$request['doctor_id'])->first();
      if(isset($doctor->id)){
        if($doctor->approval == "wait" && $doctor['on/off'] == "on"){
          $result = false;     /// 아직 인증 안됨
          $msg = "관리자의 승인을 기다리는 중 입니다.";
        }elseif($doctor->approval == "deny" && $doctor['on/off'] == "on"){
          $result = false;     /// 아직 인증 안됨
          $msg = "승인거부";
          $doctor_num = $doctor->id;
        }elseif ($doctor['on/off'] != "on") {
          $result = false;     /// 회원 정지
          $msg = "이용이 제한된 계정입니다.";
        }else{
          $token = jwt($doctor->id,Random(3));
          $fcm = \App\doctor_info::where('doctor_naver',$request['doctor_id'])->update(["fcm_token" => $request['fcm_token'],'doctor_token'=> $token]);
          $log = \App\login_log::create([
            'id_type' => 'doctor',
            'login_id' => $doctor->id,
            'ip_address'=> $_SERVER["REMOTE_ADDR"]
          ]);
          $msg = "";
          $result = true;
          $doctor_num = $doctor->id;
        }
      }else{
        $result = false;  /// 카카오 id 없음
        $msg = "계정이 존재하지 않습니다.";
      }
    }
    elseif($request->type == "google"){
      $doctor = \App\doctor_info::where('doctor_google',$request['doctor_id'])->first();
      if(isset($doctor->id)){
        if($doctor->approval == "wait" && $doctor['on/off'] == "on"){
          $result = false;     /// 아직 인증 안됨
          $msg = "관리자의 승인을 기다리는 중 입니다.";
        }elseif($doctor->approval == "deny" && $doctor['on/off'] == "on"){
          $result = false;     /// 아직 인증 안됨
          $msg = "승인거부";
          $doctor_num = $doctor->id;
        }elseif ($doctor['on/off'] != "on") {
          $result = false;     /// 회원 정지
          $msg = "이용이 제한된 계정입니다.";
        }else{
          $token = jwt($doctor->id,Random(3));
          $fcm = \App\doctor_info::where('doctor_google',$request['doctor_id'])->update(["fcm_token" => $request['fcm_token'],'doctor_token'=> $token]);
          $log = \App\login_log::create([
            'id_type' => 'doctor',
            'login_id' => $doctor->id,
            'ip_address'=> $_SERVER["REMOTE_ADDR"]
          ]);
          $msg = "";
          $result = true;
          $doctor_num = $doctor->id;
        }
      }else{
        $result = false;  /// 카카오 id 없음
        $msg = "계정이 존재하지 않습니다.";
      }
    }
    elseif($request->type == "facebook"){
      $doctor = \App\doctor_info::where('doctor_facebook',$request['doctor_id'])->first();
      if(isset($doctor->id)){
        if($doctor->approval == "wait" && $doctor['on/off'] == "on"){
          $result = false;     /// 아직 인증 안됨
          $msg = "관리자의 승인을 기다리는 중 입니다.";
        }elseif($doctor->approval == "deny" && $doctor['on/off'] == "on"){
          $result = false;     /// 아직 인증 안됨
          $msg = "승인거부";
          $doctor_num = $doctor->id;
        }elseif ($doctor['on/off'] != "on") {
          $result = false;     /// 회원 정지
          $msg = "이용이 제한된 계정입니다.";
        }else{
          $token = jwt($doctor->id,Random(3));
          $fcm = \App\doctor_info::where('doctor_facebook',$request['doctor_id'])->update(["fcm_token" => $request['fcm_token'],'doctor_token'=> $token]);
          $log = \App\login_log::create([
            'id_type' => 'doctor',
            'login_id' => $doctor->id,
            'ip_address'=> $_SERVER["REMOTE_ADDR"]
          ]);
          $msg = "";
          $result = true;
          $doctor_num = $doctor->id;
        }
      }else{
        $result = false;  /// 카카오 id 없음
        $msg = "계정이 존재하지 않습니다.";
      }
    }
    elseif($request->type == "twitter"){
      $doctor = \App\doctor_info::where('doctor_twitter',$request['doctor_id'])->first();
      if(isset($doctor->id)){
        if($doctor->approval == "wait" && $doctor['on/off'] == "on"){
          $result = false;     /// 아직 인증 안됨
          $msg = "관리자의 승인을 기다리는 중 입니다.";
        }elseif($doctor->approval == "deny" && $doctor['on/off'] == "on"){
          $result = false;     /// 아직 인증 안됨
          $msg = "승인거부";
          $doctor_num = $doctor->id;
        }elseif ($doctor['on/off'] != "on") {
          $result = false;     /// 회원 정지
          $msg = "이용이 제한된 계정입니다.";
        }else{
          $token = jwt($doctor->id,Random(3));
          $fcm = \App\doctor_info::where('doctor_twitter',$request['doctor_id'])->update(["fcm_token" => $request['fcm_token'],'doctor_token'=> $token]);
          $log = \App\login_log::create([
            'id_type' => 'doctor',
            'login_id' => $doctor->id,
            'ip_address'=> $_SERVER["REMOTE_ADDR"]
          ]);
          $msg = "";
          $result = true;
          $doctor_num = $doctor->id;
        }
      }else{
        $result = false;  /// 카카오 id 없음
        $msg = "계정이 존재하지 않습니다.";
      }
    }else{
      $doctor = \App\doctor_info::where('doctor_id',$request['doctor_id'])->first();
      if(isset($doctor->id)){
        if (Hash::check($request['doctor_pw'], $doctor->doctor_pw)) {
          if($doctor->approval == "wait" && $doctor['on/off'] == "on"){
            $result = false;     /// 아직 인증 안됨
            $msg = "관리자의 승인을 기다리는 중 입니다.";
          }elseif($doctor->approval == "deny" && $doctor['on/off'] == "on"){
            $result = false;     /// 아직 인증 안됨
            $msg = "승인거부";
            $doctor_num = $doctor->id;
          }elseif ($doctor['on/off'] != "on") {
            $result = false;     /// 회원 정지
            $msg = "이용이 제한된 계정입니다.";
          }else{
            $token = jwt($doctor->id,Random(3));
            $fcm = \App\doctor_info::where('doctor_id',$request['doctor_id'])->update(["fcm_token" => $request['fcm_token'],'doctor_token'=> $token]);
            $log = \App\login_log::create([
              'id_type' => 'doctor',
              'login_id' => $doctor->id,
              'ip_address'=> $_SERVER["REMOTE_ADDR"]
            ]);
            $msg = "";
            $result = true;
            $doctor_num = $doctor->id;
          }
        }else{
          $result = false;   /// 비밀번호 없음
          $msg = "비밀번호가 일치하지 않습니다.";
        }
      }else{
        $result = false;    /// id 없음
        $msg = "아이디가 존재하지 않습니다.";
      }
    }
    if(isset($doctor->id))
    {
      $doctor_address = \App\hospital_info::where('doctor_id',$doctor->id)->first();
    }else {
      $doctor_address = \App\hospital_info::where('doctor_id',"")->first();
    }

    if(isset($doctor_address->address)) {
      $address = $doctor_address->address;
    }else {
      $address = "";
    }
    return response()->json([
      'result' => $result,
      'message' => $msg,
      'doctor_num' => $doctor_num,
      'doctor_address' => $address,
      'token' => $token,
    ]);
  }

  /*의사 토큰 검사*/
  public function check_token(Request $request)
  {
    if(isset($request['token'])){
      $doctor = \App\doctor_info::where('doctor_token',$request['token'])->first();
      if(isset($doctor->id)){
        $doctor_id = explode('.', $doctor->doctor_token);
        $doctor_id = base64_decode($doctor_id['1']);
        $doctor_id = json_decode($doctor_id,true);
        if($doctor->id == $doctor_id['doctor_id']){
          $log = \App\login_log::create([
            'id_type' => 'doctor',
            'login_id' => $doctor->id,
            'ip_address'=> $_SERVER["REMOTE_ADDR"]
          ]);
          return response()->json([
            'result' => true,
          ]);
        }
      }
    }
    return response()->json([
      'result' => false,
    ]);
  }

  /*의사 로그아웃*/
  public function logout(Request $request)
  {
    $state = \App\doctor_info::where('id',$request['doctor_id'])->update([
      'state' => "off",
      'latitude' => "0",
      'longitude' => "0",
      'fcm_token' => NULL,
      'address' => NULL,
      'doctor_token' => NULL,
    ]);

    return response()->json([
      'result' => true,
    ]);
  }

  /*의사 fcm토큰 재설정*/
  public function fcm_token(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $fcm = \App\doctor_info::where('id',$request['doctor_id'])->update(["fcm_token" => $request['fcm_token']]);

    return response()->json([
      'result' => true,
    ]);
  }

  /*의사 상태(채팅 state)등록 */
  public function state(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }
    $hospital = \App\hospital_info::where('doctor_id',$request['doctor_id'])->first();

    if($request->doctor_state == "on"){
      if(isset($hospital)) {
      $state = \App\doctor_info::where('id',$request['doctor_id'])->update([
        'state' => $request->doctor_state,
        'latitude' => $request->latitude,
        'longitude' => $request->longitude,
        'address' => $request['address'],
      ]);

      return response()->json([
        'result' => true,
        'address' => $request['address'],
      ]);
    }else {
      return response()->json([
        'result' => false,
      ]);
    }
  }elseif($request->doctor_state == "off"){
    $state = \App\doctor_info::where('id',$request['doctor_id'])->update([
        'state' => $request->doctor_state,
        'latitude' => "0",
        'longitude' => "0",
        'address' => NULL,
      ]);
      return response()->json([
        'result' => true,
        'address' => "",
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*의사 현재위치 등록*/
  public function location(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $doctor = \App\doctor_info::where('id',$request['doctor_id'])->update([
      'latitude' => $request['latitude'],
      'longitude' => $request['longitude'],
      'address' => $request['address'],
    ]);
    return response()->json([
      'result' => true,
      'address' => $request['address'],
    ]);
  }

  /*마이페이지*/
  public function mypage(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $doctor = \App\doctor_info::where('id',$request['doctor_id'])->first();
    if(isset($doctor->id)){
      $account = \App\account::where('doctor_id',$request['doctor_id'])->first();
      $rating = \App\chat_request::where([['doctor_id',$request->doctor_id],['state','finish'],['rating','<>',NULL]])->avg('rating');
      $chat_count = \App\chat_request::where([['doctor_id',$request->doctor_id],['state','finish']])->count();
      $get_money = \App\withdraw_list::where([['doctor_id',$request->doctor_id],['state','complete']])->sum("price");
      $price = \App\accumulate::where('doctor_id',$request->doctor_id)->sum('point');
      $hospital = \App\hospital_info::where('doctor_id',$request['doctor_id'])->first();
      if(isset($hospital) && isset($account)){
        return response()->json([
          'result' => true,
          'doctor_name' => $doctor->doctor_name,
          'doctor_phone' => $doctor->doctor_phone,
          'point' => $price-$get_money,
          'rating' => $rating,
          'chat_count' => $chat_count,
          'fee' => $doctor->fee,
          'hospital' => true,
          'hospital_name' => $hospital->name,
          'hospital_address' => $hospital->address,
          'hospital_intro' => $hospital->intro,
          'hospital_url' => $hospital->url,
          'account' => true,
          'bank_name' => $account->bank_name,
          'bank_number' => $account->bank_number,
          'bank_depo' => $account->bank_depo,
        ]);
      }elseif (isset($hospital) && !isset($account)) {
        return response()->json([
          'result' => true,
          'doctor_name' => $doctor->doctor_name,
          'doctor_phone' => $doctor->doctor_phone,
          'point' => $price-$get_money,
          'rating' => $rating,
          'chat_count' => $chat_count,
          'fee' => $doctor->fee,
          'hospital' => true,
          'hospital_name' => $hospital->name,
          'hospital_address' => $hospital->address,
          'hospital_intro' => $hospital->intro,
          'hospital_url' => $hospital->url,
          'account' => false,
        ]);
      }elseif (!isset($hospital) && isset($account)) {
        return response()->json([
          'result' => true,
          'doctor_name' => $doctor->doctor_name,
          'doctor_phone' => $doctor->doctor_phone,
          'point' => $price-$get_money,
          'rating' => $rating,
          'chat_count' => $chat_count,
          'fee' => $doctor->fee,
          'hospital' => false,
          'account' => true,
          'bank_name' => $account->bank_name,
          'bank_number' => $account->bank_number,
          'bank_depo' => $account->bank_depo,
        ]);
      }else{
        return response()->json([
          'result' => true,
          'doctor_name' => $doctor->doctor_name,
          'doctor_phone' => $doctor->doctor_phone,
          'point' => $price-$get_money,
          'rating' => $rating,
          'chat_count' => $chat_count,
          'fee' => $doctor->fee,
          'hospital' => false,
          'account' => false,
        ]);
      }
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }


  /*내 정보 불러오기 <수정 시>*/
  public function mypage_load(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $doctor = \App\doctor_info::where('id',$request['doctor_id'])->first();
    if(isset($doctor->id)){
        return response()->json([
          'result' => true,
          'doctor_id' => $doctor->doctor_id,
          'doctor_kakao' => $doctor->doctor_kakao,
          'doctor_naver' => $doctor->doctor_naver,
          'doctor_google' => $doctor->doctor_google,
          'doctor_facebook' => $doctor->doctor_facebook,
          'doctor_twitter' => $doctor->doctor_twitter,
          'doctor_name' => $doctor->doctor_name,
          'doctor_phone' => $doctor->doctor_phone,
        ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*마이페이지 수정*/
  public function mypage_update(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    if(isset($request['doctor_pw'])){  // pw 둘다 수정
      $doctor = \App\doctor_info::where('id',$request['doctor_id'])->update([
        'doctor_pw' => bcrypt($request['doctor_pw']),
      ]);
    }
    if(isset($request['doctor_phone'])){  //번호 수정
      $doctor = \App\doctor_info::where('id',$request['doctor_id'])->update([
        'doctor_phone' => $request['doctor_phone'],
      ]);
    }
    return response()->json([
      'result' => true,
    ]);
  }

  /*병원 등록*/
  public function hospital_register(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $hospital = \App\hospital_info::create([
      'doctor_id' => $request['doctor_id'],
      'name' => $request['hospital_name'],
      'address' => $request['hospital_address'],
      'intro' => $request['hospital_intro'],
      'url' => $request['hospital_url'],
    ]);
    if(isset($hospital->id)){
      return response()->json([
        'result' => true,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*병원정보 불러오기*/
  public function hospital_load(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $hospital = \App\hospital_info::where('doctor_id',$request['doctor_id'])->first();
    if(isset($hospital)){
      return response()->json([
        'result' => true,
        'hospital_name' => $hospital->name,
        'hospital_address' => $hospital->address,
        'hospital_intro' => $hospital->intro,
        'hospital_url' => $hospital->url,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*병원 수정*/
  public function hospital_update(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $hospital = \App\hospital_info::where('doctor_id',$request['doctor_id'])->update([
      'name' => $request['hospital_name'],
      'address' => $request['hospital_address'],
      'intro' => $request['hospital_intro'],
      'url' => $request['hospital_url'],
    ]);
    return response()->json([
      'result' => true,
    ]);
  }

  /*계좌정보 등록*/
  public function account_register(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $account = \App\account::create([
      'doctor_id' => $request['doctor_id'],
      'bank_name' => $request['bank_name'],
      'bank_number' => $request['bank_number'],
      'bank_depo' => $request['bank_depo'],
    ]);
    if(isset($account->id)){
      return response()->json([
        'result' => true,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*계좌정보 목록*/
  public function account_load(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $get_money = \App\withdraw_list::where([['doctor_id',$request->doctor_id],['state','complete']])->sum("price");
    $price = \App\accumulate::where('doctor_id',$request->doctor_id)->sum('point');
    $doctor = \App\doctor_info::where('id',$request->doctor_id)->first();
    $account = \App\account::where('doctor_id',$request['doctor_id'])->first();
    $rating = \App\chat_request::where([['doctor_id',$request->doctor_id],['state','finish'],['rating','<>',NULL]])->avg('rating');
    $chat_count = \App\chat_request::where([['doctor_id',$request->doctor_id],['state','finish']])->count();
    if(isset($account->id)){
      return response()->json([
        'result' => true,
        'bank_name' => $account->bank_name,
        'bank_number' => $account->bank_number,
        'bank_depo' => $account->bank_depo,
        'point' => $price-$get_money,
        'rating' => $rating,
        'chat_count' => $chat_count,
        'doctor_name' => $doctor->doctor_name,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*계좌정보 수정*/
  public function account_update(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $account = \App\account::where('doctor_id',$request['doctor_id'])->update([
      'bank_name' => $request['bank_name'],
      'bank_number' => $request['bank_number'],
      'bank_depo' => $request['bank_depo'],
    ]);
    return response()->json([
      'result' => true,
    ]);
  }

  /*출금신청 등록*/
  public function withdraw_register(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    //금액 환산
    $fee = \App\doctor_info::where('id',$request->doctor_id)->first();
    $fee = $fee->fee;

    $get_money = floor($request['price']*(100-$fee)/100);

    $withdraw = \App\withdraw_list::create([
      'doctor_id' => $request['doctor_id'],
      'price' => $request['price'],
      'fee' => $fee,
      'get_money' => $get_money,
    ]);

    if(isset($withdraw->id)){
      return response()->json([
        'result' => true,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*출금신청  내역*/
  public function withdraw_list(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $withdraw_id = array(); $price = array(); $fee = array(); $get_money = array(); $state = array(); $coment = array(); $date = array();
    $withdraws = \App\withdraw_list::where('doctor_id',$request['doctor_id'])->orderBy('id','desc')->get();

    foreach ($withdraws as $i => $withdraw) {
      $withdraw_id[$i] = $withdraw->id;
      $price[$i] = $withdraw->price;
      $fee[$i] = $withdraw->fee;
      $get_money[$i] = $withdraw->get_money;
      $state[$i] = $withdraw->state;
      $coment[$i] = $withdraw->coment;
      $date[$i] = $withdraw->created_at;
    }

    if($withdraws != "[]"){
      return response()->json([
        'result' => true,
        'withdraw_id' => $withdraw_id,
        'price' => $price,
        'fee' => $fee,
        'get_money' => $get_money,
        'state' => $state,
        'coment' => $coment,
        'date' => $date,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*출금신청 수정*/
  public function withdraw_update(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $withdraw = \App\withdraw_list::where('id',$request['withdraw_id'])->first();

    if($withdraw->state == "wait"){
      //금액 환산
      $fee = \App\doctor_info::where('id',$request->doctor_id)->first();
      $fee = $fee->fee;

      $get_money = floor($request['price']*(100-$fee)/100);

      $withdraw = \App\withdraw_list::where([['id',$request['withdraw_id']],["state","wait"]])->update([
        'price' => $request['price'],
        'fee' => $fee,
        'get_money' => $get_money,
      ]);

      return response()->json([
        'result' => true,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*출금신청 삭제*/
  public function withdraw_destroy(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->doctor_id);
    if(isset($q)){
      return $q;
    }

    $withdraw = \App\withdraw_list::where('id',$request['withdraw_id'])->first();
    if($withdraw->state == "wait"){
      $withdraw = \App\withdraw_list::where([['id',$request['withdraw_id']],["state","wait"]])->delete();
      return response()->json([
        'result' => true,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*파일 업로드*/
  public function Upload(Request $request)
  {
    // 1)
    $doctor = base64_decode($request['doctor_license']);   // 파일 디코딩
    $file_doctor = Storage::disk('doctor_license')->put($request['doctor_license_name'], $doctor);  // 파일 저장

    // 2)
    $uploadedFile = $request->file('file'); // 파일 설정
    $filename = $uploadedFile->getClientOriginalName();  //파일 이름불러오기
    $file = $uploadedFile ->storeAs('public/img',$filename);  //파일 이름($filename)으로 경로(public/img)에 저장

  }
}

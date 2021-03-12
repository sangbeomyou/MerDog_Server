<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class UserAppController extends Controller
{
  public function __construct()
  {
    function check($id){
      // 이용 정지 회원인지 확인
      $stop = \App\user_info::where('id',$id)->first();
      if($stop['on/off'] == 'off'){
        return response()->json([
          'result' => false
        ]);
      }
    }
  }

  /*사용자 등록*/
  public function register(Request $request)
  {
    if($request->type == "kakao"){
      $user = \App\user_info::create([
        'user_kakao'=> $request->input('user_id'),
        'user_nick'=> $request->input('user_name'),
        'user_phone'=> $request->input('user_phone'),
      ]);
      return response()->json([
        'result' => true,
      ]);
    }elseif($request->type == "naver"){
      $user = \App\user_info::create([
        'user_naver'=> $request->input('user_id'),
        'user_nick'=> $request->input('user_name'),
        'user_phone'=> $request->input('user_phone'),
      ]);
      return response()->json([
        'result' => true,
      ]);
    }else{
      $user = \App\user_info::create([
        'user_id'=> $request->input('user_id'),
        'user_pw'=> bcrypt($request->input('user_pw')),
        'user_nick'=> $request->input('user_name'),
        'user_phone'=> $request->input('user_phone'),
      ]);
      return response()->json([
        'result' => true,
      ]);
    }
  }

  /*전화번호 중복확인*/
  public function check_phone(Request $request)
  {
    $user = \App\user_info::where('user_phone',$request['user_phone'])->first();
    if(isset($user->id)){
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
    $user = \App\user_info::where('user_id',$request['user_id'])->first();
    if(isset($user->id)){
      $result = false;
    }else{
      $result = true;
    }
    return response()->json([
      'result' => $result,
    ]);
  }

  /*닉네임 중복확인*/
  public function check_nick(Request $request)
  {
    $user = \App\user_info::where('user_nick',$request['user_name'])->first();
    if(isset($user->id)){
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
    $user = \App\user_info::where([['user_phone',$request['user_phone']],['user_nick',$request['user_name']]])->first();
    if(isset($user->id)){
      return response()->json([
        'result' => true,
        'user_id' => $user->user_id,
        'user_kakao' => $user->user_kakao,
        'user_naver' => $user->user_naver,
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

    $user = \App\user_info::where([['user_id',$request['user_id']],['user_phone',$request['user_phone']]])->update(['user_pw' => bcrypt($pw)]);
    if($user != "0"){
      //전화번호 형식
      $recv = preg_replace("/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/", "$1-$2-$3", $request['user_phone']);
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
            'phone' => $request['user_phone'],
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
      'result' => $result
    ]);
  }

  /*사용자 로그인*/
  public function login(Request $request)
  {
    function jwt($id,$random){
      // Create token header as a JSON string
      $header = json_encode(['typ' => 'JWT', 'alg' => 'HS256']);

      // Create token payload as a JSON string
      $payload = json_encode(['user_id' => $id]);

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

    $user_num = "";
    $state = "";
    $token = "";

    //카카오 계정
    if($request->type == "kakao"){
      $user = \App\user_info::where('user_kakao',$request['user_id'])->first();
      if(isset($user->id)){
        if($user['on/off']=="on") {
          $token = jwt($user->id,Random(3));
          $fcm = \App\user_info::where('user_kakao',$request['user_id'])->update(["fcm_token" => $request['fcm_token'],"user_token" => $token]);
          $log = \App\login_log::create([
            'id_type' => 'user',
            'login_id' => $user->id,
            'ip_address'=> $_SERVER["REMOTE_ADDR"]
          ]);
          $result = true;
          $user_num = $user->id;
        }else{
          $result = false;
          $state = "off";
        }

      }else{
        $result = false;
      }
      return response()->json([
        'result' => $result,
        'user_num' => $user_num,
        'state' => $state,
        'token' => $token,
      ]);
      //네이버 계정
    }elseif ($request->type == "naver") {
      $user = \App\user_info::where('user_naver',$request['user_id'])->first();
      if(isset($user->id)){
        if($user['on/off']=="on") {
          $token = jwt($user->id,Random(3));
          $fcm = \App\user_info::where('user_naver',$request['user_id'])->update(["fcm_token" => $request['fcm_token'],"user_token" => $token]);
          $log = \App\login_log::create([
            'id_type' => 'user',
            'login_id' => $user->id,
            'ip_address'=> $_SERVER["REMOTE_ADDR"]
          ]);
          $result = true;
          $user_num = $user->id;
        }else{
          $result = false;
          $state = "off";
        }

      }else{
        $result = false;
      }

      return response()->json([
        'result' => $result,
        'user_num' => $user_num,
        'state' => $state,
        'token' => $token,
      ]);
    }else{
      $user = \App\user_info::where('user_id',$request['user_id'])->first();
      if(isset($user->id)){
        if (Hash::check($request['user_pw'], $user->user_pw)) {
          if($user['on/off']=="on") {
            $token = jwt($user->id,Random(3));
            $fcm = \App\user_info::where('user_id',$request['user_id'])->update(["fcm_token" => $request['fcm_token'],"user_token" => $token]);
            $log = \App\login_log::create([
              'id_type' => 'user',
              'login_id' => $user->id,
              'ip_address'=> $_SERVER["REMOTE_ADDR"]
            ]);
            $result = true;
            $user_num = $user->id;
          }else{
            $result = false;
            $state = "off";
          }
        }else{
          $result = false;
        }

      }else{
        $result = false;
      }

      return response()->json([
        'result' => $result,
        'user_num' => $user_num,
        'state' => $state,
        'token' => $token,
      ]);
    }
  }

  /*사용자 토큰 검사*/
  public function check_token(Request $request)
  {
    if(isset($request['token'])){
      $user = \App\user_info::where('user_token',$request['token'])->first();
      if(isset($user->id)){
        $user_id = explode('.', $user->user_token );
        $user_id = base64_decode($user_id[1]);
        $user_id = json_decode($user_id,true);
        if($user->id == $user_id['user_id']){
          $log = \App\login_log::create([
            'id_type' => 'user',
            'login_id' => $user->id,
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

  /*사용자 로그아웃*/
  public function logout(Request $request)
  {
    $fcm = \App\user_info::where('id',$request['user_id'])->update(["fcm_token" => NULL, 'user_token' => NULL]);

    return response()->json([
      'result' => true,
    ]);
  }

  /*사용자 fcm토큰 재설정*/
  public function fcm_token(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $fcm = \App\user_info::where('id',$request['user_id'])->update(["fcm_token" => $request['fcm_token']]);

    return response()->json([
      'result' => true,
    ]);
  }

  /*사용자 이용권 갯수*/
  public function ticket(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $user = \App\user_info::where('id',$request['user_id'])->first();
    if(isset($user)){
      return response()->json([
        'result' => true,
        'ticket' => $user->ticket,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*사용자 마이페이지*/
  public function mypage(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $user = \App\user_info::where('id',$request['user_id'])->first();
    $chats = \App\chat_request::where('user_id',$user->id)->whereNull('rating')->get();
    $chat = array();
    foreach ($chat as $value) {
      $chat[] = $value->id;
    }
    if(isset($user)){
      return response()->json([
        'result' => true,
        'user_name' => $user->user_nick,
        'user_phone' => $user->user_phone,
        'chat_request_id' => $chat,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*사용자 마이페이지 수정*/
  public function mypage_update(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    if(isset($request['user_pw'])){  //pw 수정
      $user_pw = \App\user_info::where('id',$request['user_id'])->update([
        'user_pw' => bcrypt($request['user_pw']),
      ]);
    }
    if(isset($request['user_phone'])){  //번호 수정
      $user_phone = \App\user_info::where('id',$request['user_id'])->update([
        'user_phone' => $request['user_phone'],
      ]);
    }
    if(isset($request['user_name'])){  //닉네임 수정
      $user_nick = \App\user_info::where('id',$request['user_id'])->update([
        'user_nick' => $request['user_name'],
      ]);
    }

    return response()->json([
      'result' => true,
    ]);
  }

  /*사용자 반려동물 목록*/
  public function pet_list(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $pets = \App\pet_info::where([['user_id',$request['user_id']],['on/off','on']])->get();
    if($pets !="[]"){
      $pet_id = array(); $pet_main_type = array(); $pet_sub_type = array(); $pet_name = array();
      $pet_age = array(); $pet_gender = array(); $pet_img = array();
      foreach ($pets as $i => $pet) {
        $pet_id[$i] = $pet->id; $pet_main_type[$i] = $pet->pet_main_type; $pet_sub_type[$i] = $pet->pet_sub_type;
        $pet_name[$i] = $pet->pet_name; $pet_age[$i] = $pet->pet_age; $pet_gender[$i] = $pet->pet_gender;
        $pet_img[$i] = $pet->pet_img;
      }
      return response()->json([
        'result' => true,
        'pet_id' => $pet_id,
        'pet_main_type' => $pet_main_type,
        'pet_sub_type' => $pet_sub_type,
        'pet_name' => $pet_name,
        'pet_age' => $pet_age,
        'pet_gender' => $pet_gender,
        'pet_img' => $pet_img,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*사용자 반려동물 등록*/
  public function pet_register(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $img = NULL;
    
    if(isset($request['pet_img']) && isset($request['pet_img_name'])){
      $file_name = $request['pet_img_name'];
      $file_check = Storage::disk('pet')->exists($file_name);
      while ($file_check) {
        $file_name = $request['pet_img_name'];
        $randomNum = mt_rand(1, 99);
        $file_name = "(".$randomNum.")".$file_name;
        $file_check = Storage::disk('pet')->exists($file_name);
      }
      $insert_img = base64_decode($request['pet_img']);   // 파일 디코딩
      $file_pet = Storage::disk('pet')->put($file_name, $insert_img);  // 파일 저장
      if($file_pet){
        $img = "http://ccit2019.cafe24.com/storage/img/pet/".$file_name;
      }
    }

    $pet = \App\pet_info::create([
      'user_id'=> $request->input('user_id'),
      'pet_main_type'=> $request->input('pet_main_type'),
      'pet_sub_type'=> $request->input('pet_sub_type'),
      'pet_name'=> $request->input('pet_name'),
      'pet_age'=> $request->input('pet_age'),
      'pet_gender'=> $request->input('pet_gender'),
      'pet_birth'=> $request->input('pet_birth'),
      'pet_notice'=> $request->input('pet_notice'),
      'pet_img'=> $img,
    ]);
    if(isset($pet->id)){
      return response()->json([
        'result' => true,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*사용자 반려동물 상세*/
  public function pet_detail(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $pet = \App\pet_info::where('id',$request['pet_id'])->first();
    return response()->json([
      'result' => true,
      'pet_id' => $pet->id,
      'pet_main_type' => $pet->pet_main_type,
      'pet_sub_type' => $pet->pet_sub_type,
      'pet_name' => $pet->pet_name,
      'pet_age' => $pet->pet_age,
      'pet_gender' => $pet->pet_gender,
      'pet_birth' => $pet->pet_birth,
      'pet_notice' => $pet->pet_notice,
      'pet_img' => $pet->pet_img,
    ]);
  }

  /*사용자 반려동물 수정*/
  public function pet_update(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }
    $pet = \App\pet_info::where('id',$request['pet_id'])->first();

    if(isset($request['pet_img']) && isset($request['pet_img_name'])){
      $file_name = $request->input('pet_img_name');
      $file_check = Storage::disk('pet')->exists($file_name);
      while ($file_check) {
        $randomNum = mt_rand(1, 99);
        $file_name = $randomNum."-".$file_name;
      }
      $insert_img = base64_decode($request['pet_img']);   // 파일 디코딩
      $file_pet = Storage::disk('pet')->put($file_name, $insert_img);  // 파일 저장
      $pet_name = explode('/',$pet->pet_img);
      $pet_name = $pet_name['6'];
      $delete = Storage::disk('pet')->delete($pet_name);  // 파일 삭제
      if($file_pet){
        $img = "http://ccit2019.cafe24.com/storage/img/pet/".$file_name;
      }
    }else{
      $img = $pet->pet_img;
    }
    $pet = \App\pet_info::where('id',$request['pet_id'])->update([
      'pet_main_type'=> $request->pet_main_type,
      'pet_sub_type'=> $request->pet_sub_type,
      'pet_name'=> $request->pet_name,
      'pet_age'=> $request->pet_age,
      'pet_gender'=> $request->pet_gender,
      'pet_birth'=> $request->pet_birth,
      'pet_notice'=> $request->pet_notice,
      'pet_img'=> $img,
    ]);
    return response()->json([
      'result' => true,
    ]);
  }

  /*사용자 반려동물 삭제*/
  public function pet_destroy(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $pet = \App\pet_info::where('id',$request['pet_id'])->update(['on/off' => 'off']);
    if($pet != "0"){
      return response()->json([
        'result' => true,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*상품 목록 불러오기*/
  public function product(Request $request)
  {
    $products = \App\product::where('on/off','on')->get();
    $product_id = array(); $product_name = array(); $product_img = array(); $product_ticket = array(); $product_price = array();
    foreach ($products as $i => $product) {
      $product_id[$i] = $product->id;
      $product_name[$i] = $product->name;
      $product_img[$i] = "http://ccit2019.cafe24.com/storage/img/product/".$product->img;
      $product_ticket[$i] = $product->ticket;
      $product_price[$i] = $product->price;
    }
    return response()->json([
      'result' => true,
      'product_id' => $product_id,
      'product_name' => $product_name,
      'product_img' => $product_img,
      'product_ticket' => $product_ticket,
      'product_price' => $product_price,
    ]);
  }

  /*결제신청*/
  public function payment(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $payment = \App\payment_list::create([
      'user_id'=> $request->input('user_id'),
      'product_id'=> $request->input('product_id'),
      'state'=> "complete",
    ]);

    $product = \App\product::where("id",$request->product_id)->first();
    $user = \App\user_info::where("id",$request->user_id)->first();

    $users = \App\user_info::where("id",$request->user_id)->update([
      "ticket"=> $user->ticket+$product->ticket,
    ]);

    if(isset($payment->id)){
      return response()->json([
        'result' => true,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*결제 내역 목록*/
  public function payment_list(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $payments = \App\payment_list::where("user_id",$request->user_id)->get();
    $payment_id = array(); $product_id = array(); $state = array(); $date = array();
    foreach ($payments as $i => $payment) {
      $payment_id[$i] = $payment->id;
      $product_id[$i] = $payment->product_id;
      $state[$i] = $payment->state;
      $date[$i] = $payment->created_at;
    }
    return response()->json([
      'result' => true,
      'payment_id' => $payment_id,
      'product_id' => $product_id,
      'state' => $state,
      'date' => $date,
    ]);
  }

  /*결제 내역 상세*/
  // public function payment_load(Request $request)
  // {
  //   // 이용 정지 회원인지 확인
  //   $q = check($request->user_id);
  //   if(isset($q)){
  //     return $q;
  //   }
  //
  //   $payment = \App\payment_list::where([["user_id",$request->user_id],["id",$request->payment_id]])->first();
  //
  //   if($payment->method == "passbook"){
  //     return response()->json([
  //       'result' => true,
  //       'payment_id' => $payment->id,
  //       'product_id' => $payment->product_id,
  //       'method' => $payment->method,
  //       'bank_name' => $payment->bank_name,
  //       'bank_depo' => $payment->bank_depo,
  //       'state' => $payment->state,
  //       'date' => $payment->created_at,
  //     ]);
  //   }else{
  //     return response()->json([
  //       'result' => true,
  //       'payment_id' => $payment->id,
  //       'product_id' => $payment->product_id,
  //       'method' => $payment->method,
  //       'state' => $payment->state,
  //       'date' => $payment->created_at,
  //     ]);
  //   }
  // }

  /*환불 신청*/
  public function refund(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $payment = \App\payment_list::where('id',$request->payment_id)->first();

    if($payment->state == "complete"){
      $refund = \App\refund_list::create([
        'user_id'=> $request->input('user_id'),
        'payment_list_id'=> $request->input('payment_id'),
        'order_id'=> $request->input('order_id'),
      ]);

      if(isset($refund->id)){
        return response()->json([
          'result' => true,
        ]);
      }else{
        return response()->json([
          'result' => false,
        ]);
      }
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*환불 신청 내역 목록*/
  public function refund_list(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $refunds = \App\refund_list::where([["user_id",$request->user_id],["state","<>","complete"]])->get();
    $refund_id = array(); $payment_list_id = array(); $order_id = array(); $coment = array(); $state = array(); $date = array();
    foreach ($refunds as $i => $refund) {
      $refund_id[$i] = $refund->id;
      $payment_list_id[$i] = $refund->payment_list_id;
      $order_id[$i] = $refund->order_id;
      $coment[$i] = $refund->coment;
      $state[$i] = $refund->state;
      $date[$i] = $refund->created_at;
    }
    return response()->json([
      'result' => true,
      'refund_id' => $refund_id,
      'payment_id' => $payment_list_id,
      'order_id' => $order_id,
      'coment' => $coment,
      "state" => $state,
      'date' => $date,
    ]);
  }

  /*환불 신청 상세*/
  // public function refund_load(Request $request)
  // {
  //   // 이용 정지 회원인지 확인
  //   $q = check($request->user_id);
  //   if(isset($q)){
  //     return $q;
  //   }
  //
  //   $refund = \App\refund_list::where([["user_id",$request->user_id],['id',$request->refund_id]])->first();
  //   return response()->json([
  //     'result' => true,
  //     'refund_id' => $refund->id,
  //     'payment_id' => $refund->payment_list_id,
  //     'bank_name' => $refund->bank_name,
  //     'bank_number' => $refund->bank_number,
  //     'bank_depo'=> $refund->bank_depo,
  //     "state" => $refund->state,
  //     'date' => $refund->created_at,
  //   ]);
  // }

  // /*환불 신청 수정*/
  // public function refund_update(Request $request)
  // {
  //   // 이용 정지 회원인지 확인
  //   $q = check($request->user_id);
  //   if(isset($q)){
  //     return $q;
  //   }
  //
  //   $check = \App\refund_list::where('id',$request['refund_id'])->first();
  //   if($check->state != "wait"){
  //     return response()->json([
  //       'result' => false,
  //     ]);
  //   }else{
  //     $refund = \App\refund_list::where([['id',$request['refund_id']],["state","wait"]])->update([
  //       'payment_list_id'=> $request->payment_id,
  //       'bank_name'=> $request->bank_name,
  //       'bank_number'=> $request->bank_number,
  //       'bank_depo'=> $request->bank_depo,
  //     ]);
  //
  //     return response()->json([
  //       'result' => true,
  //     ]);
  //   }
  // }

  /*환불 신청 삭제*/
  public function refund_destroy(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    $check = \App\refund_list::where('id',$request['refund_id'])->first();
    if($check->state == "wait"){
      $refund = \App\refund_list::where([['id',$request['refund_id']],["state","wait"]])->delete();

      return response()->json([
        'result' => true,
      ]);
    }else{
      return response()->json([
        'result' => false,
      ]);
    }
  }

  /*평점 등록*/
  public function rating(Request $request)
  {
    // 이용 정지 회원인지 확인
    $q = check($request->user_id);
    if(isset($q)){
      return $q;
    }

    if(isset($request['chat_request_id']) && isset($request['rating'])){
      $chat = \App\chat_request::where('id',$request['chat_request_id'])->first();
      if($chat['state'] == "finish"){
        $rating = \App\chat_request::where('id',$request['chat_request_id'])->update(['rating' => $request->rating]);
        return response()->json([
          'result' => true,
        ]);
      }
    }
    return response()->json([
      'result' => false,
    ]);
  }


}

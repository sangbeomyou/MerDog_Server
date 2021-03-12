<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AjaxController extends Controller
{
  //아이디 중복확인
  public function check_id(Request $request)
  {
    $admin = \App\admin_info::where('admin_id',$request['admin_id'])->first();
    if(isset($admin->id)){
      $result = false;
    }else{
      $result = true;
    }
    return response()->json([
      'result' => $result,
    ]);
  }

  //SMS 인증
  public function sendSMS(Request $request)
  {
    //전화번호 형식
    $recv = preg_replace("/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/", "$1-$2-$3", $request['phone']);
    $msg = "[MerDog] 본인확인 인증번호 [".$request['number']."] 를 입력해주세요.";

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
          'phone' => $request['phone'],
          'type' => "본인 인증",
          'ip_address' => $_SERVER["REMOTE_ADDR"],
        ]);
      }else{
        $result = false;
      }
    }else {
      $result = false;
    }

    return response()->json([
      'result' => $result,
    ]);
  }
}

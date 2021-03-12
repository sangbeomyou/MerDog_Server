<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LogController extends Controller
{


  //로그인만 이용가능한 컨트롤러
  public function __construct()
  {
    $this->middleware('auth');
    $this->middleware('checkstatus');
  }

  /*로그인 로그 내역*/
  public function login_log($id=null)
  {
    if(isset($id)){
      $id = explode("_",$id);
      $type = $id['0'];
      $id = $id['1'];
      if($type == "user"){
        $logs = \App\login_log::where([['login_id',$id],['id_type','user']])->get();
      }elseif($type == "doctor") {
        $logs = \App\login_log::where([['login_id',$id],['id_type','doctor']])->get();
      }
      return view('log.login_log',compact('logs'))->with('id',$id)->with('type',$type);;
    }else{
      $logs = \App\login_log::get();
      return view('log.login_log',compact('logs'));
    }
  }

  /*FCM 로그 내역*/
  public function fcm_log($id=null)
  {
    if(isset($id)){
      $id = explode("_",$id);
      $type = $id['0'];
      $id = $id['1'];
      if($type == "user"){
        $logs = \App\fcm_log::where([['fcm_id',$id],['id_type','user']])->get();
      }elseif($type == "doctor") {
        $logs = \App\fcm_log::where([['fcm_id',$id],['id_type','doctor']])->get();
      }
      return view('log.fcm_log',compact('logs'))->with('id',$id)->with('type',$type);;
    }else{
      $logs = \App\fcm_log::get();
      return view('log.fcm_log',compact('logs'));
    }
  }

  /*SMS 발송 로그 내역*/
  public function sms_log($id=null)
  {
    $logs = \App\sms_log::get();
    return view('log.sms_log',compact('logs'));
  }
}

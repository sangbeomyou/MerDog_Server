<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class RegisterController extends Controller
{
  //로그인하지 않은 사람만 이용가능한 컨트롤러
  public function __construct()
  {
    $this->middleware('guest');
  }

  public function create()
  {
    return view("login.register");
  }

  public function store(Request $request)
  {
    $this->validate($request,[
      'admin_id' => 'required|max:20|min:5|unique:admin_info,admin_id|regex:/^[a-z0-9\-+]{5,20}$/',
      'admin_pw' => 'required|max:15|min:5|confirmed|regex:/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*])[a-zA-Z0-9~!@#$%^&*]{5,15}$/',
      'checkbox' => 'required',
    ]);

    $user = \App\admin_info::create([
      'admin_id'=> $request->input('admin_id'),
      'admin_pw'=> bcrypt($request->input('admin_pw')),
    ]);

    // flash('가입 신청이 완료되었습니다. 관리자의 승인 후 로그인이 가능합니다.')->info();
    return redirect()->route('login')->with('alert','가입 신청이 완료되었습니다. \n관리자의 승인 후 로그인이 가능합니다.');
  }
}

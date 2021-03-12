<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;

class LoginController extends Controller
{
  //로그인하지 않은 사람만 이용가능한 컨트롤러 <로그아웃 제외>
  public function __construct()
  {
    $this->middleware('guest',['except' => 'destroy']);
  }

  public function create()
  {
    return view("login.login");
  }

  public function store(Request $request)
  {
    $this->validate($request,[
      'admin_id' => 'required|max:20|min:5',
      'admin_pw' => 'required|max:15|min:5',
    ]);

    $admin = \App\admin_info::where('admin_id',$request['admin_id'])->first();

    if(!isset($admin)){
      flash("아이디가 존재하지 않습니다.")->error();
      return back()->withInput();
    }else{
      if (!Hash::check($request['admin_pw'], $admin->admin_pw)) {
        flash("비밀번호가 맞지 않습니다.")->error();
          return back()->withInput();
      }

      $level = \App\level_list::where('id',$admin->level)->first();

      if(isset($level)){
        if($level->level == "wait"){
          flash("승인되지 않은 계정입니다. 관리자에게 문의하세요.")->error();
          return back()->withInput();
          // return redirect()->back()->withInput()->with('alert', '승인되지 않은 계정입니다. 관리자에게 문의하세요.');
        }
      }
    }

    auth()->login($admin);
    return redirect()->route('home');
  }

  public function destroy()
  {
    auth()->logout();
    flash('또 방문해주세요.');
    return redirect('/');
  }
}

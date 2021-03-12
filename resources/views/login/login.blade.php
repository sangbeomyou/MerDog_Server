@extends('layouts/layout_login')

@section('js')
  <script type="text/javascript">
    $(function(){
      $("#find_pw").click(function(){
        alert("관리자에게 문의하세요.");
      });
    });
  </script>
@endsection

@section('content')
  <div class="text-center">
    <h1 class="h4 text-gray-900 mb-4">LOGIN</h1>
    <hr>
  </div>
  <form class="user" action="{{ route('login.store')}}" method="post">
    {!! csrf_field() !!}
    <div class="form-group">
      <input type="text" name="admin_id" class="form-control form-control-user" id="exampleInputId" aria-describedby="idHelp" placeholder="아이디를 입력하세요" value="{{ old('admin_id') }}">
      {!! $errors->first('admin_id', '<span class="form-error">:message</span>') !!}
    </div>
    <div class="form-group">
      <input type="password" name="admin_pw" class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호를 입력하세요" value="{{ old('admin_pw') }}">
      {!! $errors->first('admin_pw', '<span class="form-error">:message</span>') !!}
    </div>
    <div class="form-group">
      <div class="custom-control custom-checkbox small">
        <input type="checkbox" name="remember" class="custom-control-input" id="customCheck" {{ old('remember') ? 'checked' : '' }} >
        <label class="custom-control-label" for="customCheck">자동 로그인</label>
      </div>
    </div>
    <button class="btn btn-primary btn-user btn-block">로그인</button>
  </form>
  <hr>
  <div class="text-center mb-2">
    <a class="small" href="#" id="find_pw">비밀번호 찾기</a>
  </div>
  <div class="text-center">
    <span>회원이 아니라면? </span>
    <a href="{{ route('register')}} ">가입하세요</a>
  </div>
@endsection

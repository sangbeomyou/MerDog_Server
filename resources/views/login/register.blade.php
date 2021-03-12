@extends('layouts/layout_login')

@section('js')
  <script type="text/javascript">
    $(function(){
      $("#check").click(function(){
        var pattern = /^[a-z0-9\-+]{5,12}$/;
        var str = $("input[name=admin_id]").val();
        if(pattern.exec(str)){
          $.ajax({
            headers: {
              'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            type: 'POST',
            url: '{{ route('ajax.check_id') }}',
            data: {
              admin_id:$("input[name=admin_id]").val(),
            },
            dataType: 'JSON',
            success: function(data) {
              if(data.result == true){
                // $("input[name=check]").val("1");
                alert("사용가능한 아이디입니다.");
              }else{
                // $("input[name=check]").val("0");
                alert("이미 사용중인 아이디입니다.");
              }
            },
            error: function(data) {
              alert("error"+data);
            }
          })
        }else{
          alert("형식을 확인해주세요");
        }
      });
    });
  </script>
@endsection

@section('content')
  <div class="text-center">
    <h1 class="h4 text-gray-900 mb-4">계정 생성</h1>
    <hr>
  </div>
  <form class="user" action="{{ route('register.store')}}" method="post">
    {!! csrf_field() !!}
    <h1 class="h5 text-gray-900">아이디</h1>
    <div class="form-group row">
      <div class="col-sm-8 mb-3 mb-sm-0">
        <input type="text" name="admin_id" class="form-control form-control-user" id="exampleInputId" placeholder="아이디를 입력하세요" value="{{ old('admin_id') }}">
        {!! $errors->first('admin_id', '<span class="form-error">:message</span>') !!}
      </div>
      <div class="col-sm-4 mb-3 mb-sm-0">
        <button type="button" class="btn btn-primary btn-user btn-block" id="check">중복확인</button>
      </div>
    </div>
    <div class="h5 text-gray-900 small ">5~20자의 영문 소문자, 숫자, 특수문자(-)만 입력 가능합니다.​</div>
    <h1 class="h5 text-gray-900 mt-4">비밀번호</h1>
      <div class="form-group">
        <input type="password" name="admin_pw" class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호를 입력하세요" value="{{ old('admin_pw') }}">
        {!! $errors->first('admin_pw', '<span class="form-error">:message</span>') !!}
      </div>
    <div class="h5 text-gray-900 small">5~15자의 영문 대 소문자, 숫자, 특수문자(!@#$%^&*)를 <br>혼합하여 입력하세요.</div>
    <h1 class="h5 text-gray-900 mt-4">비밀번호 재입력</h1>
    <div class="form-group">
      <input type="password" name="admin_pw_confirmation"class="form-control form-control-user" id="exampleInputPassword" placeholder="비밀번호를 재입력하세요" value="{{ old('admin_pw_confirmation') }}">
    </div>
    <div class="form-group mt-4">
      <div class="custom-control custom-checkbox small">
        <input type="checkbox" name="checkbox" class="custom-control-input" id="customCheck" {{ old('checkbox') ? 'checked' : '' }}>
        <label class="custom-control-label" for="customCheck">관리자의 승인 후 로그인이 가능합니다.​</label>
      </div>
      {!! $errors->first('checkbox', '<span class="form-error">:message</span>') !!}
    </div>
    <div class="form-group row">
      <div class="col-sm-6 mb-3 mb-sm-0">
        <button class="btn btn-primary btn-user btn-block"> 가입</button>
      </div>
      <div class="col-sm-6 mb-3 mb-sm-0">
        <a href="{{ url("/") }}" class="btn btn-google btn-user btn-block">취소</a>
      </div>
    </div>
  </form>
  <hr>
  <div class="text-center">
    이미 계정이 있으신가요? <a href="{{ route('login') }}">로그인 하기</a>
  </div>
@endsection

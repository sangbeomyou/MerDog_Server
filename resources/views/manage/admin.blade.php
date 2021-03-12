@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0,4];
  var index = 3;
  var type = 'normal'
  var footer = 0;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2,3];
  var title = '관리자 <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 관리자 </p>


    <!-- 검색창 Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">검색</h6>
      </div>
      <div class="card-body">
        <label for="basic-url">날짜</label>
        <div class="mb-3">
          <button type="button" class="btn btn-primary btn btn-xs" name="dateType" id="dateType1" value="" onclick="setSearchDate(0);"/>오늘</button>
          <button type="button" class="btn btn-primary btn btn-xs" name="dateType" id="dateType2" onclick="setSearchDate(1);"/>어제</button>
          <button type="button" class="btn btn-primary btn btn-xs" name="dateType" id="dateType3" onclick="setSearchDate(2);"/>일주일</button>
          <button type="button" class="btn btn-primary btn btn-xs" name="dateType" id="dateType4" onclick="setSearchDate(3);"/>이번달</button>
          <button type="button" class="btn btn-primary btn btn-xs" name="dateType" id="dateType5" onclick="setSearchDate(4);"/>1개월</button>
          <button type="button" class="btn btn-primary btn btn-xs" name="dateType" id="dateType6" onclick="setSearchDate(5);"/>3개월</button>
        </div>
        <div class="input-group" style="width:420px;">
          <input data-toggle="datepicker" type="text" class="form-control " id="date_from" name="date_from" readonly value="">
          <div class="input-group-prepend">
            <span class="input-group-text">~</span>
          </div>
          <input data-toggle="datepicker" type="text" style="margin-right:10px" class="form-control" id="date_to" name="date_to" readonly value="">
          <button type="button" class="btn btn-flat btn-outline-dark btn btn-sm" id="reset" onclick="location.reload();">
            <i class="fas fa-sync-alt"></i>
          </button>
        </div>
        {{-- <label for="basic-url">입력</label>
        <div class="input-group mb-3" style="width:420px;">
          <select class="custom-select" style="margin-right:10px" id="">
            <option selected>항목</option>
            <option value="">One</option>
            <option value="">Two</option>
            <option value="">Three</option>
          </select>
          <input type="text" class="form-control" style="width:200px; margin-right:10px;" id="search" name="search" value="" placeholder="검색어를 입력해주세요.">
          <button class="btn btn-primary btn-sm" style="margin-right:10px" type="submit">
            검색
          </button>
        </div> --}}
      </div>
    </div>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">[관리자] 회원 목록</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive" >
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th width="5%">NO.</th>
                <th width="20%">ID</th>
                <th width="25%">직급</th>
                <th width="30%">등록일</th>
                <th width="20%">비밀번호 재설정</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($admins as $i=>$admin)
                <tr>
                  <td>{{ ++$i }}</td>
                  <td>{{ $admin->admin_id }}</td>
                  <td>
                    <form action="{{ route('manage.admin_level') }}" method="post" onsubmit="return check_level('{{ $admin->level }}','{{ $admin->id }}')">
                      @csrf
                      @php
                        $levels = \App\level_list::get();
                      @endphp
                      <input type="hidden" name="user_num" value="{{ $admin->id }}">
                      <select class="custom-select custom-select-sm form-control form-control-sm" style="width:120px" id="{{ $admin->id }}" name="level">
                        @foreach ($levels as $level)
                          @if ($admin->level == $level->id)
                            <option value="{{$level->id}}" selected>{{$level->level}}</option>
                          @else
                          <option value="{{$level->id}}">{{$level->level}}</option>
                          @endif
                        @endforeach
                      </select>
                      &nbsp&nbsp&nbsp&nbsp
                      <button type="submit" class="btn btn-success btn-circle btn-sm"><i class="fas fa-check"></i></button>
                    </form>
                  </td>
                  <td>{{ $admin->created_at }}</td>
                  <td>
                    <button class="btn btn-info btn-sm" href="#" data-toggle="modal" data-target="#Modal" data-keyboard="false" data-backdrop="static" onclick="return send_id('{{ $admin->id }}');">비밀번호 재설정</button>
                  </td>
                </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  {{-- Modal --}}
  <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content" >
        <div class="modal-header">
          <h5 class="modal-title title" id="exampleModalLabelh5">비밀번호 재설정</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form action="{{ route('manage.admin_pw') }}" method="post" onsubmit="return check();">
          @csrf
          <div class="modal-body">
            <h1 class="h5 text-gray-900 mt-4">비밀번호</h1>

            <input type="hidden" name="user_num">

            <div class="form-group">
              <input type="password" name="admin_pw" class="form-control form-control-user" placeholder="비밀번호를 입력하세요" value="{{ old('admin_pw') }}">
              {!! $errors->first('admin_pw', '<span class="form-error">:message</span>') !!}
            </div>
            <div id="guide" class="h5 small"></div>
            <input type="hidden" name="guide" value="0">
            <h1 class="h5 text-gray-900 mt-4">비밀번호 재입력</h1>
            <div class="form-group">
              <input type="password" name="admin_pw_confirmation"class="form-control form-control-user" placeholder="비밀번호를 재입력하세요" value="{{ old('admin_pw_confirmation') }}">
            </div>
            <div id="guide_confirm" class="h5 small"></div>
            <input type="hidden" name="guide_confirm" value="0">
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" type="submit">적용</button>
            <button class="btn btn-secondary" type="button" data-dismiss="modal">돌아가기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  {{-- Modal End--}}
@endsection

@section('js')
  <script type="text/javascript">

    function check_level(level,num) {
      if($("#"+num+" option:selected").val() == level){
        alert("선택하신 직급이 현재 직급과 같습니다.");
        return false;
      }
    }

    //모달로 관리자 회원 번호 전송
    function send_id(id) {
      $("input[name=user_num]").val("")
      $("input[name=admin_pw]").val("")
      $("input[name=admin_pw_confirmation]").val("")
      $("#guide").html("5~15자의 영문 대 소문자, 숫자, 특수문자(!@#$%^&*)를 혼합하여 입력하세요.");
      $("#guide").css("color","grey");
      $("#guide_confirm").html("");
      if(id){
        $("input[name=user_num]").val(id);
      }else{
        return false;
      }
    }

    //모달 폼 전송 체크
    function check() {
      if($("input[name=guide_confirm]").val() != "1" || $("input[name=guide]").val() != "1"){
        alert("비밀번호를 확인해주세요.")
        return false;
      }
    }

    $(function(){
      // 비밀번호 정규식
      var regExp = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*])[a-zA-Z0-9~!@#$%^&*]{5,15}$/;

      //키입력 및 값 변경시 중복체크 처리
      function pw_confirm(){
        if($("input[name=admin_pw_confirmation]").val()){
          if($("input[name=admin_pw_confirmation]").val() == $("input[name=admin_pw]").val()){
            $("input[name=guide_confirm]").val("1");
            $("#guide_confirm").css("color","green");
            $("#guide_confirm").html("비밀번호가 일치합니다.");
          }else{
            $("input[name=guide_confirm]").val("0");
            $("#guide_confirm").css("color","red");
            $("#guide_confirm").html("비밀번호가 일치하지 않습니다.");
          }
        }
      }

      //키입력 및 값 변경시 문구 처리
      $("input[name=admin_pw]").on("keyup change", function() {
        if(regExp.test($("input[name=admin_pw]").val())){
          $("input[name=guide]").val("1");
          $("#guide").css("color","green");
          $("#guide").html("올바른 비밀번호 입니다.");
        }else{
          $("input[name=guide]").val("0");
          $("#guide").css("color","red");
          $("#guide").html("5~15자의 영문 대 소문자, 숫자, 특수문자(!@#$%^&*)를 혼합하여 입력하세요.");
        }
        pw_confirm()
      });

      //키입력 및 값 변경시 중복체크 처리
      $("input[name=admin_pw_confirmation]").on("keyup change", function() {
        pw_confirm()
      });
    })


    //데이터테이블 셀렉트 옵션 추가
    $(document).ready( function() {
      $('#select').append('<option value="1">ID</option>');
    });


  //데이터 테이블 날짜 검색 칼럼번호 설정
  $.fn.dataTable.ext.search.push(
    function(settings, data, dataIndex){
      var min = Date.parse($('#date_from').val());
      var max = Date.parse($('#date_to').val());
      var target = data[3];
      var targetDate = Date.parse(target.substring(0, 10));

      if( (isNaN(min) && isNaN(max) ) ||
          (isNaN(min) && targetDate <= max )||
          ( min <= targetDate && isNaN(max) ) ||
          ( targetDate >= min && targetDate <= max) ){
        return true;
      }
      return false;
    }
  )
  </script>
@endsection

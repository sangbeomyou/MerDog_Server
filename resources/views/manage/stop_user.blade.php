@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0];
  var index = 1;
  var type = "normal";
  var footer = 0;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2,3,4,5,6,7,8,9,10];
  var title = '정지 회원 <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 일반 회원 >> 정지 회원 </p>


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
        <div class="input-group" style="">
          <div class="input-group" style="width:420px">
            <input data-toggle="datepicker" type="text" class="form-control " id="date_from" name="date_from" readonly value="">
            <div class="input-group-prepend">
              <span class="input-group-text">~</span>
            </div>
            <input data-toggle="datepicker" type="text" style="margin-right:10px" class="form-control" id="date_to" name="date_to" readonly value="">
            <button type="button" class="btn btn-flat btn-outline-dark btn btn-sm" id="reset" onclick="location.reload();">
              <i class="fas fa-sync-alt"></i>
            </button>
          </div>
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
        <h6 class="m-0 font-weight-bold text-primary">[일반 회원] 정지 회원 목록</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th width="%">NO.</th>
                <th width="5%">회원번호</th>
                <th width="10%">ID</th>
                <th width="10%">카카오 ID</th>
                <th width="10%">네이버 ID</th>
                <th width="10%">닉네임</th>
                <th width="10%">전화 번호</th>
                <th width="%">등록일</th>
                <th width="%">정지 해제</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($users as $i=>$user)
              <tr onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#d7e9fb')" style="cursor:pointer">
                <td>{{ ++$i }}</td>
                <td>{{ $user->id }}</td>
                <td>{{ isset($user->user_id) ? $user->user_id : "-"}}</td>
                <td>{{ isset($user->user_kakao) ? $user->user_kakao : "-"}}</td>
                <td>{{ isset($user->user_naver) ? $user->user_naver : "-"}}</td>
                <td>{{ $user->user_nick }}</td>
                <td>{{ $user->user_phone }}</td>
                <td>{{ $user->created_at }}</td>
                <td>
                  <input type="hidden" name="id" value="{{ $user->id }}">
                  <button class="btn btn-success btn-circle btn-sm" type="submit">
                  <i class="fas fa-check"></i>
                  </button>
                </td>
              </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
@endsection

@section('js')
  <script type="text/javascript">
  //Row 색상 변경
  function changeTrColor(trObj, oldColor, newColor) {
				trObj.style.backgroundColor = newColor;
				trObj.onmouseout = function(){
					trObj.style.backgroundColor = oldColor;
				}
			}
			function clickTrEvent(trObj) {
				alert(trObj.id);
			}

      function detailLink(url){
        document.location.href = url;
      }

      //데이터테이블 셀렉트 옵션 추가
      $(document).ready( function() {
        $('#select').append('<option value="2">ID</option>');
        $('#select').append('<option value="3">카카오 ID</option>');
        $('#select').append('<option value="4">네이버 ID</option>');
        $('#select').append('<option value="5">닉네임</option>');
        $('#select').append('<option value="6">전화번호</option>');
      });

    //데이터 테이블 날짜 검색 칼럼번호 설정
    $.fn.dataTable.ext.search.push(
      function(settings, data, dataIndex){
        var min = Date.parse($('#date_from').val());
        var max = Date.parse($('#date_to').val());
        var target = data[10];
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

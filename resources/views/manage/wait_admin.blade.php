@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0,3,4];
  var index = 2;
  var type = 'normal'
  var footer = 0;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2];
  var title = '승인 대기 [관리자] <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">승인 대기</h1>
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
        <h6 class="m-0 font-weight-bold text-primary">[관리자] 승인 대기 목록</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive" >
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th width="5%">NO.</th>
                <th width="30%">ID</th>
                <th width="30%">등록일</th>
                <th width="15%">승인</th>
                <th width="15%">거부</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($admins as $admin)
                <tr onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#d7e9fb')" style="cursor:default">
                  <td></td>
                  <td>{{ $admin->admin_id }}</td>
                  <td>{{ $admin->created_at }}</td>
                  <td>
                    <form action="{{ route("manage.wait_admin.update") }}" method="post">
                      @csrf
                      <input type="hidden" name="id" value="{{ $admin->id }}">
                      <button class="btn btn-success btn-circle btn-sm" type="submit">
                        <i class="fas fa-check"></i>
                      </button>
                    </form>
                  </td>
                  <td>
                    <form onsubmit="return confirms();" action="{{ route("manage.wait_admin.delete") }}" method="post">
                      @csrf
                      <input type="hidden" name="id" value="{{ $admin->id }}">
                      <button class="btn btn-danger btn-circle btn-sm" type="submit">
                        <i class="fas fa-trash"></i>
                      </button>
                    </form>
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

    // alert(target)
    //거부 시 confirm 박스
    function confirms() {
      var con = confirm("거부 하시겠습니까? 거부 시 복구할 수 없습니다.");
      if(con == false){
        return false;
      }
    }

    //데이터테이블 셀렉트 옵션 추가
    $(document).ready( function() {
      $('#select').append('<option value="1">ID</option>');
    });


  //데이터 테이블 날짜 검색 칼럼번호 설정
  $.fn.dataTable.ext.search.push(
    function(settings, data, dataIndex){
      var min = Date.parse($('#date_from').val());
      var max = Date.parse($('#date_to').val());
      var target = data[2];
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

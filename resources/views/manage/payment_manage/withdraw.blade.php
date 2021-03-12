@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0];
  var index = 1;
  var type = "withdraw";
  var footer = 0;
  var footer_get_money = 5;
  var footer_price = 3;
  var footer_state = 0;
  var excel = [1,2,3,4,5,6];
  var title = '출금 내역 <?php echo json_encode($curDate); ?>';


@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">결제 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 출금 내역 </p>
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
        @if (isset($id))
          <h6 class="m-0 font-weight-bold text-primary">[의사 회원] >> 회원번호 [{{$id}}]님의 출금 내역 목록</h6>
        @else
          <h6 class="m-0 font-weight-bold text-primary">출금 내역 목록</h6>
        @endif
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th width="5%">NO.</th>
                <th width="7%">출금번호</th>
                <th width="12%">회원명(번호)</th>
                <th width="10%">출금 신청 금액</th>
                <th width="8%">수수료</th>
                <th width="10%">실 출금 금액</th>
                <th width="15%">출금 날짜</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($withdraws as $i=>$withdraw)
                <tr onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#d7e9fb')" style="cursor:default">
                  @php
                    $doctor = \App\doctor_info::where('id',$withdraw->doctor_id)->first();
                  @endphp
                  <td>{{ ++$i }}</td>
                  <td>{{ $withdraw->id }}</td>
                  <td>{{ $doctor->doctor_name }} ({{ $withdraw->doctor_id }})</td>
                  <td>&#8361; {{ number_format($withdraw->price) }}</td>
                  <td>{{ $withdraw->fee }} %</td>
                  <td>&#8361; {{ number_format($withdraw->get_money) }}</td>
                  <td>{{ $withdraw->created_at }}</td>
                </tr>
              @endforeach
            </tbody>
            <tfoot>
              <tr>
                <th id="tfoot" colspan="7" style="text-align:right;white-space:nowrap;"></th>
              </tr>
            </tfoot>
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




    //데이터테이블 셀렉트 옵션 추가
    $(document).ready( function() {
      $('#select').append('<option value="1">출금 번호</option>');
      $('#select').append('<option value="2">회원명 (번호)</option>');
    });


    //데이터 테이블 날짜 검색 칼럼번호 설정
    $.fn.dataTable.ext.search.push(
        function(settings, data, dataIndex){
            var min = Date.parse($('#date_from').val());
            var max = Date.parse($('#date_to').val());
            var target = data[6];
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

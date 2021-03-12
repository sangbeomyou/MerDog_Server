@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0,3,4,10,11];
  var index = 9;
  var type = 'request';
  var footer = 8;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 7;
  var excel = [1,2,3,4,5,6,7,8,9];
  var title = '출금 신청 내역 <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">출금 신청 내역</h1>
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
        <h6 class="m-0 font-weight-bold text-primary">출금 신청 내역 목록</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th width="5%">NO.</th>
                <th width="10%">회원명 (번호)</th>
                <th width="7%">은행명</th>
                <th width="13%">계좌번호</th>
                <th width="7%">예금주</th>
                <th width="12%">현재 보유 마일리지</th>
                <th width="10%">출금 신청 금액</th>
                <th width="7%">수수료</th>
                <th width="10%">실 출금 금액</th>
                <th width="15%">신청 날짜</th>
                <th width="5%">수락</th>
                <th width="5%">거절</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($withdraw_requests as $i=>$withdraw)
                <tr onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#d7e9fb')" style="cursor:default">
                  @php
                    $get_money = \App\withdraw_list::where([['doctor_id',$withdraw->doctor_id],['state','complete']])->sum("price");
                    $account = \App\account::where('doctor_id',$withdraw->doctor_id)->first();
                    $doctor = \App\doctor_info::where('id',$withdraw->doctor_id)->first();
                    $price = \App\accumulate::where('doctor_id',$withdraw->doctor_id)->sum('point');
                  @endphp
                  <td>{{ ++$i }}</td>
                  <td>{{$doctor->doctor_name}} ({{ $doctor->id }})</td>
                  <td>{{ isset($account->bank_name) ? $account->bank_name :"-" }}</td>
                  <td>{{ isset($account->bank_number) ? $account->bank_number :"-" }}</td>
                  <td>{{ isset($account->bank_depo) ? $account->bank_depo :"-" }}</td>
                  <td>&#8361; {{ number_format($price-$get_money) }}</td>
                  <td>&#8361; {{ number_format($withdraw->price) }}</td>
                  <td>{{ $withdraw->fee }} %</td>
                  <td>&#8361; {{ number_format($withdraw->get_money) }}</td>
                  <td>{{ $withdraw->created_at }}</td>
                  <td>
                    <form onsubmit="return check('{{$price-$get_money}}','{{$withdraw->price}}');" action="{{ route("manage.payment_manage.withdraw_request.accept") }}" method="post">
                    @csrf
                      <input type="hidden" name="id" value="{{ $withdraw->id }}">
                      <button class="btn btn-success btn-circle btn-sm" type="submit">
                      <i class="fas fa-trash"></i>
                      </button>
                    </form>
                  </td>
                  <td>
                    <button onclick="deny({{$withdraw->id}});" class="btn btn-danger btn-circle btn-sm" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#Modal">
                    <i class="fas fa-trash"></i>
                    </button>
                  </td>
                </tr>
              @endforeach
            </tbody>
            <tfoot>
              <tr>
                <th colspan="12" style="text-align:right;white-space:nowrap;"></th>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>
  </div>

  {{-- Modal --}}
  <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
    <div class="modal-dialog" role="document" style="max-width:700px;">
      <div class="modal-content" >
        <div class="modal-header">
          <h5 class="modal-title title" id="exampleModalLabelh5">출금 거부 사유 입력</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form onsubmit="return confirms();" action="{{ route("manage.payment_manage.withdraw_request.deny") }}" method="post">
          @csrf
          <div class="modal-body">
            <h1 class="h5 text-gray-900">거부 사유</h1>

            <input type="hidden" name="id">

            <div class="form-group">
              <textarea name="coment" class="form-control form-control-user" rows="8" cols="80" placeholder="거부 사유를 입력하세요">{{ old('coment') }}</textarea>
              {!! $errors->first('coment', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-danger" type="sumbit">거부하기</button>
            <button class="btn btn-secondary" type="button" data-dismiss="modal">돌아가기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  {{-- Modal End--}}
@endsection

@section('js')  <script type="text/javascript">
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

    //모달
    function deny(id) {
      $("textarea[name=coment]").val("");
      $("input[name=id]").val(id);
    }

    //환불 거절
    function confirms(){
      if($("textarea[name=coment]").val() == ""){
        alert("거부 사유를 입력해주세요.");
        return false;
      }
      var stop = confirm("해당 환불 신청을 거부 하시겠습니까?");
      if(!stop){
        return false;
      }
    }

    //출금 승인
    function check(now, request){
      //출금 신청 금액보다 마일리지가 적을 경우 경우
      if(Number(now) < Number(request)){
        alert("현재 보유 마일리지가 출금 신청 금액보다 적어 출금이 불가능 합니다.");
        return false;
      }
    }



    //데이터테이블 셀렉트 옵션 추가
    $(document).ready( function() {
      $('#select').append('<option value="1">회원명 (번호)</option>');
      $('#select').append('<option value="2">은행명</option>');
    });


    //데이터 테이블 날짜 검색 칼럼번호 설정
    $.fn.dataTable.ext.search.push(
        function(settings, data, dataIndex){
            var min = Date.parse($('#date_from').val());
            var max = Date.parse($('#date_to').val());
            var target = data[9];
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

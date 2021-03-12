@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0,7,8,9];
  var index = 1;
  var type = 'passbook'
  var footer = 6;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2,3,4,5,6,10];
  var title = '무통장 결제 내역 <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
    <div class="container-fluid">

      <!-- Page Heading -->
      <h1 class="h3 mb-2 text-gray-800">결제 관리</h1>
      <p class="mb-4 small">&nbsp&nbsp&nbsp >> 무통장 결제 내역 </p>

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
          <h6 class="m-0 font-weight-bold text-primary">무통장 결제 내역</h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th width="5%">NO.</th>
                  <th width="5%">결제 번호</th>
                  <th width="10%">회원명(번호)</th>
                  <th width="10%">은행명</th>
                  <th width="10%">예금주</th>
                  <th width="10%">결제 상품명(번호)</th>
                  <th width="10%">결제 금액</th>
                  <th width="9%">업체 계좌</th>
                  <th width="9%">승인</th>
                  <th width="9%">거절</th>
                  <th width="15%">결제 날짜</th>
                </tr>
              </thead>
              <tbody>
                @foreach ($passbooks as $i=>$passbook)
                  @php
                    $user = \App\user_info::where('id',$passbook->user_id)->first();
                    $product = \App\product::where('id',$passbook->product_id)->first();

                  @endphp
                  <tr onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#d7e9fb')" style="cursor:default">
                    <td>{{ ++$i }}</td>
                    <td>{{ $passbook->id }}</td>
                    <td>{{ $user->user_nick }} ({{ $passbook->user_id }})</td>
                    <td>{{ $passbook->bank_name }}</td>
                    <td>{{ $passbook->bank_depo }}</td>
                    <td>{{ $product->name }} ({{ $product->id }})</td>
                    <td>&#8361; {{ number_format($product->price) }}</td>
                    {{-- 사용자 입금 계좌 정보 받아오기 나중에 꼭 수정!!!!!!!!!! --}}
                    <td><button onclick="show_account('{{ isset($passbook->company_bank_name) ? $passbook->company_bank_name:"-" }}', '{{ isset($passbook->company_bank_number) ? $passbook->company_bank_number:"-" }}' ,'{{ isset($passbook->company_bank_depo) ? $passbook->company_bank_depo:"-" }}');" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#Modal">보기</button></td>
                    {{-- 사용자 입금 계좌 정보 받아오기 나중에 꼭 수정!!!!!!!!!! --}}
                    <td>
                      <form action="{{ route("manage.payment_manage.passbook_update") }}" method="post">
                        @csrf
                        <input type="hidden" name="id" value="{{ $passbook->id }}">
                        <button class="btn btn-success btn-circle btn-sm" type="submit">
                          <i class="fas fa-check"></i>
                        </button>
                      </form>
                    </td>
                    <td>
                      <form onsubmit="return confirms();" action="{{ route("manage.payment_manage.passbook_delete") }}" method="post">
                        @csrf
                        <input type="hidden" name="id" value="{{ $passbook->id }}">
                        <button class="btn btn-danger btn-circle btn-sm" type="submit">
                          <i class="fas fa-trash"></i>
                        </button>
                      </form>
                    </td>
                    <td>{{ $passbook->created_at }}</td>
                  </tr>
                @endforeach
              </tbody>
              <tfoot>
                <tr>
                  <th colspan="11" style="text-align:right;white-space:nowrap;"></th>
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
            <h5 class="modal-title title" id="exampleModalLabelh5">업체 계좌 정보</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
          <table class="table table-bordered" id="th" style="text-align:left; font-size: small;" cellspacing="0" border-spacing="5px">
            <tbody>
              <tr>
                <th style="background-color:#eeeeee; padding:10px; border:1px solid #cdcfd6; text-align:center;" width=25%>업체 은행명</th>
                <td id="bank"></td>
              </tr>
              <tr>
                <th style="background-color:#eeeeee; padding:10px; border:1px solid #cdcfd6; text-align:center;">업체 계좌번호</th>
                <td id="number"></td>
              </tr>
              <tr>
                <th style="background-color:#eeeeee; padding:10px; border:1px solid #cdcfd6; text-align:center;">업체 예금주</th>
                <td id="depo"></td>
              </tr>
            </tbody>
          </table>
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">돌아가기</button>
          </div>
        </div>
      </div>
    </div>
    {{-- Modal End--}}
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

      //거부 시 confirm 박스
      function confirms() {
        var con = confirm("거부 하시겠습니까?");
        if(con == false){
          return false;
        }
      }

      //모달
      function show_account(bank, number, depo) {
        $("#bank").html(bank);
        $("#number").html(number);
        $("#depo").html(depo);
      }

      //데이터테이블 셀렉트 옵션 추가
      $(document).ready( function() {
        $('#select').append('<option value="1">결제 번호</option>');
        $('#select').append('<option value="2">회원명 (번호)</option>');
        $('#select').append('<option value="5">결제 상품명 (번호)</option>');
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

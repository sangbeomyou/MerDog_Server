@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0,11,12];
  var index = 3;
  var type = 'request';
  var footer = 7;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2,3,4,5,6,7,8,9,10];
  var title = '환불 신청 내역 <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
    <div class="container-fluid">

      <!-- Page Heading -->
      <h1 class="h3 mb-2 text-gray-800">결제 관리</h1>
      <p class="mb-4 small">&nbsp&nbsp&nbsp >> 환불 신청 내역 </p>
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
          <h6 class="m-0 font-weight-bold text-primary">환불 신청 내역</h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th width="%">NO.</th>
                  <th width="8%">회원명(번호)</th>
                  <th width="10%">보유 이용권</th>
                  <th width="5%">결제 번호</th>
                  <th width="10%">결제 상품명(번호)</th>
                  <th width="10%">상품ID(구글)</th>
                  <th width="10%">지급 이용권</th>
                  <th width="7%">결제금액</th>
                  <th width="7%">결제상태</th>
                  <th width="10%">결제 날짜</th>
                  <th width="10%">신청 날짜</th>
                  <th width="5%">승인</th>
                  <th width="5%">거부</th>
                </tr>
              </thead>
              <tbody>
              @foreach ($refunds as $i=>$refund)
                @php
                  $user = \App\user_info::where('id',$refund->user_id)->first();
                  $payment = \App\payment_list::where('id',$refund->payment_list_id)->first();
                  $product = \App\product::where('id',$payment->product_id)->first();
                @endphp
                <tr onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#d7e9fb')" style="cursor:default">
                  <td>{{ ++$i }}</td>
                  <td>{{ $user->user_nick }} ({{ $user->id }})</td>
                  <td>{{ $user->ticket }} 개</td>
                  <td>{{ $payment->id }}</td>
                  <td>{{ $product->product_code }}</td>
                  <td>{{ $product->name }} ({{ $product->id }})</td>
                  <td>{{ $product->ticket }} 개</td>
                  <td>&#8361; {{ number_format($product->price) }}</td>
                  <td>
                    @if ($payment->state == "complete")
                      결제 완료
                    @elseif ($payment->state == "refund")
                      환불
                    @elseif ($payment->state == "fail")
                      결제 실패
                    @endif
                  </td>
                  <td>{{ $payment->created_at }}</td>
                  <td>{{ $refund->created_at }}</td>
                  <td>
                    <form onsubmit="return check('{{ $user->ticket }}','{{$product->ticket}}','{{$payment->state}}');" action="{{ route("manage.payment_manage.refund_update") }}" method="post">
                    @csrf
                      <input type="hidden" name="refund_id" value="{{ $refund->id }}">
                      <input type="hidden" name="payment_id" value="{{ $payment->id }}">
                      <input type="hidden" name="user" value="{{ $refund->user_id }}">
                      <input type="hidden" name="ticket" value="{{ $product->ticket }}">
                      <button class="btn btn-success btn-circle btn-sm" type="submit">
                      <i class="fas fa-check"></i>
                      </button>
                    </form>
                  </td>
                  <td>
                    <button onclick="deny({{$refund->id}});" class="btn btn-danger btn-circle btn-sm" type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#Modal">
                    <i class="fas fa-trash"></i>
                    </button>
                  </td>
                </tr>
              @endforeach
              </tbody>
              <tfoot>
                <tr>
                  <th colspan="13" style="text-align:right;white-space:nowrap;"></th>
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
            <h5 class="modal-title title" id="exampleModalLabelh5">환불 거부 사유 입력</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <form onsubmit="return confirms();" action="{{ route("manage.payment_manage.refund_delete") }}" method="post">
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

  //환불 승인
  function check(user_ticket, product_ticket , state){
    if(state == "complete"){  //결제완료가 아닐경우 환불불가 / 이용권이 모자를경우
      if(user_ticket > product_ticket){
        alert("보유 이용권이 지급된 이용권보다 적어 환불이 불가능 합니다.");
        return false;
      }
    }else{
      alert("환불이 불가능 합니다.");
      return false;
    }
  }





        //데이터테이블 셀렉트 옵션 추가
        $(document).ready( function() {
          $('#select').append('<option value="1">회원명 (번호)</option>');
          $('#select').append('<option value="3">결제 번호</option>');
          $('#select').append('<option value="4">결제 상품명 (번호)</option>');
          $('#select').append('<option value="5">상품ID(구글)</option>');
          $('#select').append('<option value="8">결제 상태</option>');
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

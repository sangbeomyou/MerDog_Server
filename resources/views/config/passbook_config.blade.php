@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0, 5, 6];
  var index = 4;
  var type = 'normal'
  var footer = 0;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2,3,4];
  var title = '무통장 계좌 내역 <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">설정</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 무통장 입금 계좌 설정 </p>


    <!-- 검색창 Example -->
    <div class="card shadow mb-4" style="width:25%; margin-right:2%; float:left">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">연결된 계좌</h6>
      </div>
      <div class="card-body">
        @php
          $account = \App\passbook_account::where('on/off', 'on')->first();
        @endphp
        <div class="card bg-success text-white shadow mb-4 py-3">
          <div class="card-body">
            <div class="text-white-50 small">은행명</div>
            {{ $account->bank_name }}
          </div>
        </div>
        <div class="card bg-success text-white shadow mb-4 py-3">
          <div class="card-body">
            <div class="text-white-50 small">계좌번호</div>
            {{ $account->bank_number }}
          </div>
        </div>
        <div class="card bg-success text-white shadow mb-4 py-3">
          <div class="card-body">
            <div class="text-white-50 small">예금주</div>
            {{ $account->bank_depo }}
          </div>
        </div>
        <div class="input-group" style="">
          <button style="margin-left: auto;" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#Modal" data-keyboard="false" data-backdrop="static" id="modal">계좌 등록</button>

        </div>
      </div>
    </div>

    <!-- DataTales Example -->
    <div class="card shadow mb-4" style="width:73%">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">계좌 목록</h6>
          <h6 class="m-0 font-weight-bold text-primary small">※연결 제외</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th width="5%">NO.</th>
                <th width="7%">은행명</th>
                <th width="10%">계좌 번호</th>
                <th width="7%">예금주</th>
                <th width="10%">등록일</th>
                <th width="7%">등록 / 미등록</th>
                <th width="7%">삭제</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($passbooks as $i=>$passbook)
                @php

                @endphp
                <tr>
                  <td>{{ ++$i }}</td>
                  <td>{{ $passbook->bank_name }}</td>
                  <td>{{ $passbook->bank_number }}</td>
                  <td>{{ $passbook->bank_depo }}</td>
                  <td>{{ $passbook->created_at }}</td>
                  <td onclick="event.cancelBubble = true;">
                    <form action={{ route("config.passbook_config.update") }} method="post">
                      @csrf
                      <input type="hidden" name="passbook_id" value="{{ $passbook->id }}">
                      <button type="submit" class="btn btn-info btn-circle btn-sm"><i class="fas fa-exchange-alt"></i></button>
                    </form>
                    {{-- <form action={{ route("manage.product_manage.product_delete", ["id" => $product->id]) }} method="post" onsubmit="return deleteID();">
                      @csrf
                      <input type="hidden" class="form-control" name="product_id" value="{{ $product->id }}" >
                      <button class="btn btn-danger btn-sm" type="submit">
                      삭제</button>
                    </form> --}}
                  </td>
                  <td>
                    <form onsubmit="return confirms();" action="{{ route("config.passbook_config.delete") }}" method="post">
                      @csrf
                      <input type="hidden" name="passbook_delete_id" value="{{ $passbook->id }}">
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


  {{-- Modal --}}
  <div class="modal fade" id="Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content" >
        <div class="modal-header mb-2">
          <h5 class="modal-title title" id="exampleModalLabelh5">무통장 계좌 등록</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form action={{ route("config.passbook_register_success") }} method="post" onsubmit="return registerID();">
          @csrf
          <div class="input-group row mb-3" style="">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">은행명</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <input type="text" class="form-control" name="bank_name" value="" required>
              {!! $errors->first('bank_name', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="input-group row mb-3" style="">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">계좌 번호</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <input type="number" min="11" max="14" class="form-control" name="bank_number" value="" required>
              {!! $errors->first('bank_number', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="input-group row mb-3" style="">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">예금주</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <input type="text" min="0" class="form-control" name="bank_depo" value="" required>
              {!! $errors->first('bank_depo', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" type="submit">등록하기</button>
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


      //거부 시 confirm 박스
      function confirms() {
        var con = confirm("삭제 하시겠습니까? 삭제 시 복구할 수 없습니다.");
        if(con == false){
          return false;
        }
      }


    //데이터테이블 셀렉트 옵션 추가
    $(document).ready( function() {
    $('#select').append('<option value="1">은행명</option>');
    $('#select').append('<option value="3">예금주</option>');
  });


  //데이터 테이블 날짜 검색 칼럼번호 설정
  $.fn.dataTable.ext.search.push(
      function(settings, data, dataIndex){
          var min = Date.parse($('#date_from').val());
          var max = Date.parse($('#date_to').val());
          var target = data[4];
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

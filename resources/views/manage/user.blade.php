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
  var title = '일반 회원 <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 일반 회원 </p>


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
          <button onclick="location.href='{{ route("manage.stop_user") }}'" class="btn btn-warning btn-sm" style="margin-left: auto; background-color:#ff407b; border-color:#ff407b;">정지회원 목록</button>
          <button id="modal_button" class="btn btn-warning btn-sm" style="margin-left: 10px; background-color:#ff407b; border-color:#ff407b;" data-toggle="modal" data-target="#Modal" data-keyboard="false" data-backdrop="static">이용권 지급</button>
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
        <h6 class="m-0 font-weight-bold text-primary">[일반 회원] 회원 목록</h6>
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
                <th width="10%">상담횟수 (회)</th>
                <th width="10%">보유 이용권 (개)</th>
                <th width="10%">총 구매 이용권 (개)</th>
                <th width="%">등록일</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($users as $i=>$user)
              @php
              $chat_count = \App\chat_request::where('user_id',$user->id)->whereIn('state',['ing','finish'])->count();
              $payments = \App\payment_list::where([['user_id',$user->id],['state','complete']])->get();
              $total = "0";
              foreach ($payments as $payment) {
                $product = \App\product::where('id',$payment->product_id)->first();
                $total = $total + $product->ticket;
              }
              @endphp
              <tr onclick="location.href='{{ route("manage.user_detail", ["id" => $user->id]) }}'" onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#d7e9fb')" style="cursor:pointer">
                <td>{{ ++$i }}</td>
                <td>{{ $user->id }}</td>
                <td>{{ isset($user->user_id) ? $user->user_id : "-"}}</td>
                <td>{{ isset($user->user_kakao) ? $user->user_kakao : "-"}}</td>
                <td>{{ isset($user->user_naver) ? $user->user_naver : "-"}}</td>
                <td>{{ $user->user_nick }}</td>
                <td>{{ $user->user_phone }}</td>
                <td>{{ number_format($chat_count) }}</td>
                <td>{{ number_format($user->ticket) }}</td>
                <td>{{ number_format($total) }}</td>
                <td>{{ $user->created_at }}</td>
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
          <h5 class="modal-title title" id="exampleModalLabelh5">이용권 지급</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form name="user_ticket" action="{{ route('manage.user_ticket') }}" method="post" onsubmit="return check();">
          @csrf
          <div class="modal-body">
            <select name="user_id[]" multiple="multiple" size="15" id="demo">
              @foreach ($users as $i=>$user)
                <option value="{{ $user->id }}">{{ $user->user_nick }} ({{$user->id}})</option>
              @endforeach
            </select>
            <h1 class="h5 text-gray-900 mt-4">이용권 갯수</h1>
            <div class="form-group">
              <input type="text" name="ticket" class="form-control form-control-user" placeholder="이용권 갯수를 입력해주세요." onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" min=1 maxlength=3  required>
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" type="submit">지급</button>
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

      function detailLink(url){
        document.location.href = url;
      }


      //멀티셀렉트
      $("#demo").bootstrapDualListbox({
       nonSelectedListLabel: "아이디 목록",
       selectedListLabel: "선택된 아이디",
       filterPlaceHolder:'닉네임 검색',
       moveAllLabel: '모두선택',
       removeAllLabel: '모두제거',
       infoText:'Total : {0}'
      });

      //모달초기화
       $('#modal_button').click(function () {
         $("input[name=ticket]").val(""); // 이용권 초기화
          $('option', $('#demo')).each(function(element) { //멀티셀렉트 초기화
           $(this).removeAttr('selected').prop('selected', false);
         });
         $("#demo").bootstrapDualListbox('refresh');
       });

       // 모달 폼 전송 체크
       function check(){
         var count = $("#demo option:selected").length;
         if(count == "0"){
           alert("아이디를 선택해주세요.")
           return false;
         }
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

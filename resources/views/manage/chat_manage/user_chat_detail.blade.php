@extends('layouts.layout_main')

@section('css')
  <style media="screen">
    #th th {
      background-color:#eeeeee;
      padding:10px; border:1px solid #cdcfd6;
      text-align:center;
    }
    table {
      border-spacing: 1022px
    }
    #doctor{
      background-color: rgba(156, 195, 240, 0.32);
    }
    #user{
      background-color: rgba(156, 240, 211, 0.32);
    }
  </style>
@endsection


@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0];
  var index = 7;
  var type = 'normal'
  var footer = 0;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2,3,4,5,6,7];
  var title = '회원별 상담 상세내역 (일반) <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">상담 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 회원별 상담 >> 일반 회원 >>상담 상세 내역 </p>

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

    {{-- 채팅카드 --}}
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        @php
          $user = \App\user_info::where('id',$id)->first();
        @endphp
        <h6 class="m-0 font-weight-bold text-primary">[일반 회원] >> 회원번호 [{{$id}}]님의 채팅 내역</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead id="chat th">
              <tr>
                <th width = 5%>NO.</th>
                <th width = 8%>방 번호</th>
                <th width = 9%>요청 번호</th>
                <th width = 10%>구분(고객/의사)</th>
                <th width = 10%>이름</th>
                <th width = 40%>메시지</th>
                <th width = 7%>타입</th>
                <th width = 10%>시간</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($user_chat_details as $user_chat_detail)
                @php
                  $chats = \App\chat::where('request_id', $user_chat_detail->id)->get();
                @endphp
                @foreach ($chats as $i => $chat)
                  <tr id="{{ $chat->id_type }}">
                    <td>{{ ++$i }}</td>
                    <td>{{ $chat->room }}</td>
                    <td>{{ $chat->request_id }}</td>

                      @if ($chat->id_type =="user")
                        <td>고객</td>
                      @else
                        <td>의사</td>
                      @endif

                      @if ($chat->id_type =="user")
                        @php
                          $user = \App\user_info::where('id',$chat->send_user)->first();
                        @endphp
                        <td>{{ $user->user_nick }}</td>
                      @else
                        @php
                          $doctor = \App\doctor_info::where('id',$chat->send_doctor)->first();
                        @endphp
                        <td>{{ $doctor->doctor_name }}</td>
                      @endif

                    @if ($chat->message_type =="text")
                      <td style="text-align:left;">{{ $chat->message }}</td>
                      <td>문자</td>
                    @elseif ($chat->message_type =="img")
                      <td style="text-align:left;"><img src="{{ $chat->message }}" style="max-width:70%"></td>
                      <td>사진</td>
                    @elseif ($chat->message_type =="video")
                      <td style="text-align:left;"><video src="{{ $chat->message }}" controls style="max-width:70%"></video></td>
                      <td>영상</td>
                    @endif
                    <td>{{ $chat->created_at }}</td>
                  </tr>
                @endforeach
              @endforeach
            </tbody>
          </table>
          <div class="btn section" style="float: right;padding-right: 0px;border-right-width: 0px;">
            {{-- 돌아가기 --}}
            <a href="{{ url()->previous() }}" class="btn btn-secondary btn-icon-split">
              <span class="text"><i class="fas fa-arrow-left">&nbsp</i>돌아가기</span>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection
@section('js')
<script type="text/javascript">
//데이터테이블 셀렉트 옵션 추가
$(document).ready( function() {
  $('#select').append('<option value="1">방 번호</option>');
  $('#select').append('<option value="2">요청 번호</option>');
  $('#select').append('<option value="3">구분</option>');
  $('#select').append('<option value="4">이름</option>');
  $('#select').append('<option value="5">메시지</option>');
  $('#select').append('<option value="6">타입</option>');
});



//데이터 테이블 날짜 검색 칼럼번호 설정
$.fn.dataTable.ext.search.push(
  function(settings, data, dataIndex){
    var min = Date.parse($('#date_from').val());
    var max = Date.parse($('#date_to').val());
    var target = data[7];
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

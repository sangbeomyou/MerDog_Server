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
  var no_order = [0, 3];
  var index = 5;
  var type = 'normal'
  var footer = 0;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2,3,4,5];
  var title = '상담 상세 내역 <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">상담 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 요청 별 상담 >> 상담 상세 내역 </p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">[{{ $chat_detail->id }}번 요청]상담 상세 내역</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive" style="text-align:left; font-size: small; float:left; margin-right:6%; width:47%">
          <h4>상담 요청 정보</h4>
          @php
            $user = \App\user_info::where('id',$chat_detail->user_id)->first();
            $doctor = \App\doctor_info::where('id',$chat_detail->doctor_id)->first();
            $pet = \App\pet_info::where('id',$chat_detail->pet_id)->first();
          @endphp
          <table class="table table-bordered" id="th" cellspacing="0">
            <tbody>
              <tr>
                <th width = 25%>상담 요청 번호</th>
                <td>{{ $chat_detail->id }}</td>
              </tr>
              <tr>
                <th>채팅방 번호</th>
                <td>{{ $chat_detail->pet_id }}</td>
              </tr>
              <tr>
                <th>회원 닉네임 (회원번호)</th>
                <td>{{ $user->user_nick }} ({{ $chat_detail->user_id }})</td>
              </tr>
              <tr>
                <th>상담 의사 이름 (회원번호)</th>
                <td>{{ $doctor->doctor_name }} ({{ $chat_detail->doctor_id }})</td>
              </tr>
              <tr>
                <th>상담 상태</th>
                @if ($chat_detail->state == "ing")
                  <td>상담 중</td>
                @elseif ($chat_detail->state == "finish")
                  <td>상담 완료</td>
                @endif
              </tr>
              <tr>
                <th>등록일</th>
                <td>{{ $chat_detail->created_at }}</td>
              </tr>
            </tbody>
          </table><table class="table table-bordered" id="th" cellspacing="0">
            <tbody>
              <tr>
                <th width = 25%>증상</th>
                <td>{{ $chat_detail->chat_title }}</td>
              </tr>
              <tr>
                <th>세부 증상 </th>
                <td>{{ $chat_detail->chat_content }}</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="table-responsive" style="text-align:left; width: 47%; font-size: small;">
          <h4>상담 반려동물 정보</h4>
          <table class="table table-bordered" id="th" cellspacing="0">
            <tbody>
              <tr>
                <th width = 25%>반려동물 (종류)</th>
                <td>{{ $pet->pet_main_type }} ({{ $pet->pet_sub_type }})</td>
              </tr>
              <tr>
                <th>반려동물 이름</th>
                <td>{{ $pet->pet_name }}</td>
              </tr>
              <tr>
                <th>반려동물 나이</th>
                <td>{{ $pet->pet_age }}</td>
              </tr>
              <tr>
                <th>반려동물 성별</th>
                <td>{{ $pet->pet_gender }}</td>
              </tr>
              <tr>
                <th>반려동물 특이사항</th>
                <td>{{ $pet->pet_notice }}</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="btn section" style="float: right; padding-right: 0px; padding-top: 9%; border-right-width: 0px;">
            <a class="btn btn-success" href="{{ route("manage.chat_manage.room_chat_detail", ["id" => $chat_detail->pet_id]) }}">
              <span class="text">[{{ $chat_detail->pet_id }}] 채팅방 전체 내역 보기</span>
            </a>
        </div>
      </div>
    </div>

    {{-- 채팅카드 --}}
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">채팅내역</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead id="chat th">
              <tr>
                <th width = 5%>NO.</th>
                <th width = 12%>구분 (고객/의사)</th>
                <th width = 10%>이름</th>
                <th width = 53%>메시지</th>
                <th width = 7%>타입</th>
                <th width = 15%>시간</th>
              </tr>
            </thead>
            <tbody>
              @php
                $chats = \App\chat::where('request_id', $chat_detail->id)->get();
              @endphp
              @foreach ($chats as $key => $chat)
                <tr id="{{ $chat->id_type }}">
                  <td>{{ ++$key }}</td>

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
  $('#select').append('<option value="1">구분</option>');
  $('#select').append('<option value="2">이름</option>');
  $('#select').append('<option value="3">메시지</option>');
  $('#select').append('<option value="4">타입</option>');
});
</script>
@endsection

@extends('layouts.layout_main')

@section('css')
  <style media="screen">
  #th th { background-color:#eeeeee; padding:10px; border:1px solid #cdcfd6; text-align:center;}
  table {border-spacing: 1022px};
  </style>
@endsection

@section('content')
  <div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 일반 회원 >> 일반 회원 상세</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">[{{ $user->user_nick }}]님 회원 상세</h6>
      </div>
      <!-- Contents -->
      <div class="card-body">
        <div class="table-responsive" style="text-align:left; font-size: small; float:left; margin-right:6%; width:47%">
          <h4>회원 정보</h4>
          <table class="table table-bordered" id="th" cellspacing="0" border-spacing="5px">
            <tbody>
              <tr>
                <th width=25%>회원번호</th>
                <td>{{ isset($user->id) ? $user->id : "-"}}</td>
              </tr>
              <tr>
                <th>아이디</th>
                <td>{{ isset($user->user_id) ? $user->user_id : "-"}}</td>
              </tr>
              <tr>
                <th>카카오 아이디</th>
                <td>{{ isset($user->user_kakao) ? $user->user_kakao : "-"}}</td>
              </tr>
              <tr>
                <th>네이버 아이디</th>
                <td>{{ isset($user->user_naver) ? $user->user_naver : "-"}}</td>
              </tr>
              <tr>
                <th>닉네임</th><td>{{ $user->user_nick }}</td>
              </tr>
              <tr>
                <th>전화번호</th><td>{{ $user->user_phone }}</td>
              </tr>
              <tr>
                <th>등록일</th><td>{{ $user->created_at }}</td>
              </tr>
              </tr>
            </tbody>
          </table>

          <table class="table table-bordered" id="th" cellspacing="0" border-spacing="5px">
            <tbody>
              <tr>
                <th width=25%>로그인 기록</th>
                <td>
                  <a href="{{ route('log.login_log', ['id' => "user_".$user->id]) }}" style="color:#7cbaf9; text-decoration:underline">
                    <로그인 기록 바로가기>
                  </a>
                </td>
              </tr>
              <tr>
                <th>FCM 발송 기록</th>
                <td>
                  <a href="{{ route('log.fcm_log', ['id' => "user_".$user->id]) }}" style="color:#7cbaf9; text-decoration:underline">
                    < FCM 발송 기록 바로가기>
                  </a>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="table-responsive" style="text-align:left; width: 47%; font-size: small;">
              <h4>결제 및 상담 정보</h4>
              <table class="table table-bordered" id="th" cellspacing="0" border-spacing="5px">
                @php
                $chat_count = \App\chat_request::where('user_id',$user->id)->whereIn('state',['ing','finish'])->count();
                $count = \App\payment_list::where([['user_id',$user->id],['state','complete']])->count();
                $payments = \App\payment_list::where([['user_id',$user->id],['state','complete']])->get();
                $total = "0";
                $price = "0";
                foreach ($payments as $payment) {
                  $product = \App\product::where('id',$payment->product_id)->first();
                  $total = $total + $product->ticket;
                  $price = $price + $product->price;
                }
                @endphp
                <tbody>
                  <tr>
                    <th width=25%>보유 이용권</th>
                    <td>{{ number_format($user->ticket) }} 개</td>
                  </tr>
                  <tr>
                    <th>총 구매 횟수</th>
                    <td>{{ number_format($count) }} 회</td>
                  </tr>
                  <tr>
                    <th>총 구매 이용권</th>
                    <td>{{ number_format($total) }} 개</td>
                  </tr>
                  <tr>
                    <th>총 구매 금액</th>
                    <td>&#8361; {{ number_format($price) }}</td>
                  </tr>
                  <tr>
                    <th>상담 횟수</th>
                    <td>{{ number_format($chat_count) }} 회</td>
                  </tr>
                  <tr>
                    <th>상담 내역 (요청별)</th>
                    <td>
                      <a href="{{ route('manage.chat', ['id' => "user_".$user->id]) }}" style="color:#7cbaf9; text-decoration:underline">
                        <요청별 상담 내역 바로가기>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <th>상담 전체보기</th>
                    <td>
                      <a href="{{ route("manage.user_chat_detail", ["id" => $user->id]) }}" style="color:#7cbaf9; text-decoration:underline">
                        <회원별 상담 내역 바로가기>
                      </a>
                    </td>
                  </tr>
                  <tr>
                    <th>결제 내역</th>
                    <td>
                      <a href="{{ route('manage.payment_manage.payment', ['id' => $user->id]) }}" style="color:#7cbaf9; text-decoration:underline">
                        <결제 내역 바로가기>
                      </a>
                    </td>
                  </tr>
                </tbody>
              </table>
          </div>
        {{-- 반려동물 --}}
        @php
          $pets = \App\pet_info::where([['user_id',$user->id],['on/off','on']])->get();
        @endphp
        @foreach ($pets as $pet)
          <div class="table-responsive" style="text-align:left; width: 47%; font-size: small; margin-right:6%;">
              <h4>반려동물 정보</h4>
              <table class="table table-bordered" id="th" cellspacing="0" border-spacing="5px">
                <tbody>
                  <tr>
                    <th width=25%>반려동물 번호</th>
                    <td>{{ isset($pet->id) ? $pet->id : "-"}}</td>
                  </tr>
                  <tr>
                    <th>반려동물 사진</th>
                    <td style="text-align:center">
                      @if (isset($pet->pet_img))
                        <img src="{{ $pet->pet_img }}" style="width:50%">
                      @else
                        -
                      @endif
                    </td>
                  </tr>
                  <tr>
                    <th>반려동물 종류</th>
                    <td>{{ isset($pet->pet_main_type) ? $pet->pet_main_type : "-"}}</td>
                  </tr>
                  <tr>
                    <th>품종</th>
                    <td>{{ isset($pet->pet_sub_type) ? $pet->pet_sub_type : "-"}}</td>
                  </tr>
                  <tr>
                    <th>이름</th>
                    <td>{{ isset($pet->pet_name) ? $pet->pet_name : "-"}}</td>
                  </tr>
                  <tr>
                    <th>나이</th>
                    <td>{{ isset($pet->pet_age) ? $pet->pet_age : "-"}}</td>
                  </tr>
                  <tr>
                    <th>생년월일</th>
                    <td>{{ isset($pet->pet_birth) ? $pet->pet_birth : "-"}}</td>
                  </tr>
                  <tr>
                    <th>성별</th>
                    <td>{{isset($pet->pet_gender) ? $pet->pet_gender : "-"}}</td>
                  </tr>
                  <tr>
                    <th>기타사항</th>
                    <td>{{ isset($pet->pet_notice) ? $pet->pet_notice : "-"}}</td>
                  </tr>
                </tbody>
              </table>
          </div>
        @endforeach
        {{-- 일시정지 --}}
        <form action={{ route("manage.user_stop") }} method="post" onsubmit="return stopID();">
          @csrf
          <div class="btn section" style="float: right;padding-right: 0px;border-right-width: 0px;">
            {{-- FCM 버튼 --}}
            <button type="button" data-toggle="modal" data-target="#Modal_FCM" data-keyboard="false" data-backdrop="static" id="modal_FCM" class="btn btn-success">FCM 발송</button>
            {{-- 이용권 지급 버튼 --}}
            <button type="button" data-toggle="modal" data-target="#Modal" data-keyboard="false" data-backdrop="static" id="modal" class="btn btn-warning" style="margin-left: auto; background-color:#ff407b; border-color:#ff407b;">이용권 지급</button>
            <input type="hidden" name="user_id" value="{{ $user->id }}">
            <button type="submit" class="btn btn-danger">회원 일시 정지</button>
            {{-- 돌아가기 --}}
            <a href="{{ route("manage.user") }}" class="btn btn-secondary btn-icon-split">
              <span class="text"><i class="fas fa-arrow-left">&nbsp</i>돌아가기</span>
            </a>
          </div>
        </form>
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
        <form action="{{ route('manage.user_detail_ticket') }}" method="post">
          @csrf
          <div class="modal-body">
            <input type="hidden" name="user_id_ticket" value="{{ $user->id }}">
            <h1 class="h5 text-gray-900 mt-2">지급 할 이용권 (개) 입력</h1>
            <div class="form-group">
              <input type="number" min="1" max="999" name="ticket" class="form-control form-control-user" placeholder="지급 할 이용권 갯수를 입력해주세요" value="{{ old('ticket') }}" required>
              {!! $errors->first('ticket', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" type="submit">적용하기</button>
            <button class="btn btn-secondary" type="button" data-dismiss="modal">돌아가기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  {{-- Modal End--}}

  {{-- FCM Modal --}}
  <div class="modal fade" id="Modal_FCM" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content" >
        <div class="modal-header">
          <h5 class="modal-title title" id="exampleModalLabelh5">FCM 발송</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form action="{{ route('manage.user_detail_fcm') }}" method="post">
          @csrf
          <div class="modal-body">
            <input type="hidden" name="user_id" value="{{ $user->id }}">
            <h1 class="h5 text-gray-900 mt-2">제목</h1>
            <div class="form-group">
              <input type="text" name="title" class="form-control form-control-user" placeholder="제목을 입력해주세요." value="" required>
              {!! $errors->first('title', '<span class="form-error">:message</span>') !!}
            </div>
            <h1 class="h5 text-gray-900 mt-2">내용</h1>
            <div class="form-group">
              <textarea class="form-control form-control-user" name="body" rows="8" cols="50" placeholder="발송하실 메시지를 입력해주세요." required></textarea>
              {!! $errors->first('body', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" type="submit">발송하기</button>
            <button class="btn btn-secondary" type="button" data-dismiss="modal">돌아가기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  {{-- FCM Modal End--}}
@endsection

@section('js')
  <script type="text/javascript">
    function stopID(){
      var stop = confirm("해당 회원을 일시 정지 하시겠습니까?");
      if(!stop){
        return false;
      }else{
        alert("해당 회원이 정지되었습니다.");
      }
    }

    // FCM 발송 모달 초기화
    $('#modal_FCM').click(function () {
      $("input[name=title]").val("");
      $("textarea[name=body]").val("");
    });
    // 이용권 지급 모달 초기화
    $('#modal').click(function () {
      $("input[name=ticket]").val("");
    });
  </script>
@endsection

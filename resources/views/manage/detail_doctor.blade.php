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
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 의사 회원 >> 의사 회원 상세</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">[{{ $doctor->doctor_name }}]님 회원 상세</h6>
      </div>
      <!-- Contents -->
      <div class="card-body">
        <div class="table-responsive" style="text-align:left; font-size: small; float:left; margin-right:6%; width:47%">
          {{-- 의사 회원 계정 정보 --}}
          <h4>의사 회원 정보</h4>
            @php
              $chat_count = \App\chat_request::where('doctor_id',$doctor->id)->whereIn('state',['ing','finish'])->count();
              $rating = \App\chat_request::where([['doctor_id',$doctor->id],['state','finish'],['rating','<>',NULL]])->avg('rating');
            @endphp
          <table class="table table-bordered" id="th" cellspacing="0" border-spacing="5px">
            <tbody>
              <tr>
                <th width=25%>회원번호</th>
                <td>{{ isset($doctor->id) ? $doctor->id : "-"}}</td>
              </tr>
              <tr>
                <th>아이디</th>
                <td>{{ isset($doctor->doctor_id) ? $doctor->doctor_id : "-"}}</td>
              </tr>
              <tr>
                <th>카카오 아이디</th>
                <td>{{ isset($doctor->doctor_kakao) ? $doctor->doctor_kakao : "-"}}</td>
              </tr>
              <tr>
                <th>네이버 아이디</th>
                <td>{{ isset($doctor->doctor_naver) ? $doctor->doctor_naver : "-"}}</td>
              </tr>
              <tr>
                <th>이름</th><td>{{ $doctor->doctor_name }}</td>
              </tr>
              <tr>
                <th>전화번호</th><td>{{ $doctor->doctor_phone }}</td>
              </tr>
              <tr>
                <th>등록일</th><td>{{ $doctor->created_at }}</td>
              </tr>
            </tbody>
          </table>

          <table class="table table-bordered" id="th" cellspacing="0" border-spacing="5px">
            <tbody>
              <tr>
                <th width=25%>로그인 기록</th><td><a href="{{ route('log.login_log', ['id' => "doctor_".$doctor->id]) }}" style="color:#7cbaf9; text-decoration:underline"><로그인 기록 바로가기></a></td>
              </tr>
              <tr>
                <th>FCM 발송 기록</th><td><a href="{{ route('log.fcm_log', ['id' => "doctor_".$doctor->id]) }}" style="color:#7cbaf9; text-decoration:underline">< FCM 발송 기록 바로가기></a></td>
              </tr>
            </tbody>
          </table>

          <table class="table table-bordered" id="th" cellspacing="0" border-spacing="5px">
            <tbody>
              <tr>
                <th width=25%>평점</th><td>{{ isset($rating) ? number_format($rating,'1') : "-" }} 점</td>
              </tr>
              <tr>
                <th>상담 횟수</th><td>{{ number_format($chat_count) }} 회</td>
              </tr>
              <tr>
                <th>상담 내역 (요청별)</th><td><a href="{{ route('manage.chat', ['id' => "doctor_".$doctor->id]) }}" style="color:#7cbaf9; text-decoration:underline"><요청별 상담 내역 바로가기></a></td>
              </tr>
              <tr>
                <th>상담 전체보기</th><td><a href="{{ route('manage.doctor_chat_detail', ['id' => $doctor->id]) }}" style="color:#7cbaf9; text-decoration:underline"><회원별 상담 내역 바로가기></a></td>
              </tr>
            </tbody>
          </table>
         </div>
        <div class="table-responsive" style="text-align:left; width: 47%; font-size: small;">
          {{-- 결제정보 --}}
          @php
            $bank = \App\account::where('doctor_id',$doctor->id)->first();
            $mileage = \App\withdraw_list::where([['doctor_id',$doctor->id],['state','complete']])->sum("price");
            $get_money = \App\withdraw_list::where([['doctor_id',$doctor->id],['state','complete']])->sum("get_money");
            $count = \App\withdraw_list::where([['doctor_id',$doctor->id],['state','complete']])->count();
            $price = \App\accumulate::where('doctor_id',$doctor->id)->sum('point');
          @endphp
          <h4>출금 및 계좌 정보</h4>
          <table class="table table-bordered" id="th" cellspacing="0">
            <tbody>
              <tr>
                <th width = 25%>총 마일리지</th>
                <td>&#8361; {{ number_format($price) }}</td></td>
              </tr>
              <tr>
                <th>현재 보유 마일리지</th><td>&#8361; {{ number_format($price - $mileage) }}</td>
              </tr>
              <tr>
                <th>출금 횟수</th>
                <td>{{ number_format($count) }} 회</td></td>
              </tr>
              <tr>
                <th>수수료</th>
                <td>{{ $doctor->fee }} %</td></td>
              </tr>
              <tr>
                <th>총 출금 마일리지<br>(수수료 미포함)</th>
                <td>&#8361; {{ number_format($mileage) }}</td></td>
              </tr>
              <tr>
                <th>총 출금 금액<br>(수수료 포함)</th>
                <td>&#8361; {{ number_format($get_money) }}</td></td>
              </tr>
              <tr>
                <th>출금 내역</th>
                <td>
                  <a href="{{ route('manage.payment_manage.withdraw', ['id' => $doctor->id]) }}" style="color:#7cbaf9; text-decoration:underline">
                    <출금 내역 바로가기>
                  </a>
                </td>
              </tr>
            </tbody>
          </table>
          <table class="table table-bordered" id="th" cellspacing="0">
            <tbody>
              <tr>
                <th width = 25%>은행명</th><td>{{ isset($bank->bank_name) ? $bank->bank_name : "-" }}</td>
              </tr>
              <tr>
                <th>계좌번호</th><td>{{ isset($bank->bank_number) ? $bank->bank_number : "-" }}</td>
              </tr>
              <tr>
                <th>예금주</th><td>{{ isset($bank->bank_depo) ? $bank->bank_depo : "-" }}</td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="table-responsive" style="text-align:left; font-size: small; float:left; margin-right:6%; width:47%">
          {{-- 병원정보 --}}
          @php
            $hospital = \App\hospital_info::where('doctor_id',$doctor->id)->first();
          @endphp
          <h4>병원 정보</h4>
          <table class="table table-bordered" id="th" cellspacing="0">
            <tbody>
              <tr>
                <th width = 25%>병원명</th><td>{{ isset($hospital->name) ? $hospital->name : "-"}}</td>
              </tr>
              <tr>
                <th>주소</th><td>{{ isset($hospital->address) ? $hospital->address : "-"}}</td>
              </tr>
              <tr>
                <th>병원 소개</th><td>{{ isset($hospital->intro) ? $hospital->intro : "-"}}</td>
              </tr>
              <tr>
                <th>병원 홈페이지</th><td>{{ isset($hospital->url) ? $hospital->url : "-"}}</td>
              </tr>
            </tbody>
          </table>
         </div>
        <div class="table-responsive" style="text-align:left; width: 47%; font-size: small;">
          {{-- 자격증 정보 --}}
          <h4>자격증 정보</h4>
          <table class="table table-bordered" id="th" cellspacing="0">
            <tbody>
              <tr>
                @php
                  $license = \App\license::where('doctor_id',$doctor->id)->get();
                @endphp
                <th width = 25%>신분증</th>
                <td><img id="doctor_img" src="{{asset("storage/img/license")}}/{{$license['1']['img_name']}}" alt="신분증" style="width:50%;"></td>
              </tr>
              <tr>
                <th>수의사 자격증</th>
                <td><img id="doctor_img" src="{{asset("storage/img/license")}}/{{$license['0']['img_name']}}" alt="수의사 자격증" style="width:50%;"></td>
              </tr>
            </tbody>
          </table>
        </div>
        {{-- 일시정지 --}}
        <form action="{{ route("manage.doctor_stop") }}" method="post" onsubmit="return stopID();">
          @csrf
          <div class="btn section" style="float: right;padding-right: 0px;border-right-width: 0px;">
            {{-- FCM 버튼 --}}
            <button type="button" data-toggle="modal" data-target="#Modal_FCM" data-keyboard="false" data-backdrop="static" id="modal_FCM" class="btn btn-success">FCM 발송</button>
            {{-- 수수료 변경 버튼 --}}
            <button type="button" data-toggle="modal" data-target="#Modal" data-keyboard="false" data-backdrop="static" id="modal" class="btn btn-warning" style="margin-left: auto; background-color:#ff407b; border-color:#ff407b;">수수료 조정</button>

            <input type="hidden" name="doctor_id" value="{{ $doctor->id }}">
            <button type="submit" class="btn btn-danger">회원 일시 정지</button>
            {{-- 돌아가기 --}}
            <a href="{{ route("manage.doctor") }}" class="btn btn-secondary btn-icon-split">
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
           <h5 class="modal-title title" id="exampleModalLabelh5">수수료 조정</h5>
           <button class="close" type="button" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">×</span>
           </button>
         </div>
         <form action="{{ route('manage.doctor_detail_fee') }}" method="post">
           @csrf
           <div class="modal-body">
             <input type="hidden" name="doctor_id" value="{{ $doctor->id }}">
             <h1 class="h5 text-gray-900 mt-2">적용 할 수수료 (%) 입력</h1>
             <div class="form-group">
               <input type="number" name="fee" min="1" max="100" name="fee" class="form-control form-control-user" placeholder="적용 할 수수료를 입력해주세요" value="{{ old('fee') }}" required>
               {!! $errors->first('fee', '<span class="form-error">:message</span>') !!}
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
             <input type="hidden" name="doctor_id" value="{{ $doctor->id }}">
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

    // 수수료 조정 모달 초기화
    $('#modal').click(function () {
      $("input[name=fee]").val("");
    });

    // FCM 발송 모달 초기화
    $('#modal_FCM').click(function () {
      $("input[name=title]").val("");
      $("textarea[name=body]").val("");
    });
  </script>
@endsection

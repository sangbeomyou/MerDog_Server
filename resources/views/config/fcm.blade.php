@extends('layouts.layout_main')

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">설정</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> FCM 발송</p>


    <!-- 검색창 Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">FCM 발송</h6>
      </div>
      <div class="card-body">
        <form class="" action="{{ route("config.fcm_send") }}" method="post" onsubmit="return check();">
          @csrf
          <div class="card bg shadow mb-4 py-3" style="background-color:#f8f9fc">
            <div class="card-body">
              <div class="font-weight-bold text-primary small mb-3">발송 대상</div>
              <div class="form-group" >
                <div class="custom-control custom-radio" style="width:100px; float:left">
                  <input type="radio" class="custom-control-input" id="all" name="type" value="all" checked>
                  <label class="custom-control-label" for="all">전체</label>
                </div>
                <div class="custom-control custom-radio" style="width:150px; float:left">
                  <input type="radio" class="custom-control-input" id="user" name="type" value="user">
                  <label class="custom-control-label" for="user">고객 회원</label>
                </div>
                <div class="custom-control custom-radio" style="width:150px; float:left">
                  <input type="radio" class="custom-control-input" id="doctor" name="type" value="doctor">
                  <label class="custom-control-label" for="doctor">의사 회원</label>
                </div>
              </div>
            </div>
          </div>
          <div class="card bg shadow mb-4 py-3 user" style="background-color:#f8f9fc; display:none;">
            <div class="card-body">
              <div class="font-weight-bold text-primary small mb-3">결제 횟수</div>
              <div class="form-group">
                <div class="h5 small" style="color:red">※입력한 값 기준 - 같거나 큰 값에 적용※</div>
                <input type="number" min="1" name="payment" class="form-control" placeholder="결제 횟수를 입력해주세요" value="{{ old('payment') }}">
              </div>
            </div>
          </div>
          <div class="card bg shadow mb-4 py-3 doctor" style="background-color:#f8f9fc; display:none;">
            <div class="card-body">
              <div class="font-weight-bold text-primary small mb-3">평점</div>
              <div class="form-group mb-3">
                <div class="h5 small" style="color:red">※입력한 값 기준 - 같거나 큰 값에 적용※</div>
                <input type="number" min="0.1" max="5" step="0.1" name="rating" class="form-control" placeholder="평점을 입력해주세요" value="{{ old('rating') }}">
              </div>
              <div class="font-weight-bold text-primary small mb-3">상담 횟수</div>
              <div class="form-group">
                <div class="h5 small" style="color:red">※입력한 값 기준 - 같거나 큰 값에 적용※</div>
                <input type="number" min="1" name="count" class="form-control" placeholder="상담 횟수를 입력해주세요" value="{{ old('count') }}">
              </div>
              <div class="font-weight-bold text-primary small mb-3">주소</div>
              <div class="form-group">
                <select class="form-control" style="width:180px; float:left" id="sido" name="sido">
                  <option value="0" selected>-시도-</option>
                </select>
                <select class="form-control" style="width:180px; float:left" id="gugun" name="gugun">
                  <option value="0" selected>-구군-</option>
                </select>
              </div>
            </div>
          </div>
          <div class="card bg hadow mb-4 py-3" style="background-color:#f8f9fc">
            <div class="card-body">
              <div class="font-weight-bold text-primary small mb-3">제목</div>
              <div class="form-group" style="margin-bottom:0px">
                {{-- <div class="h5 small" style="color:red">※입력한 값 기준 - 같거나 큰 값에 적용※</div> --}}
                <input type="text" name="title" class="form-control form-control-user" placeholder="알림 제목을 입력해주세요" value="{{ old('title') }}" required>
                {!! $errors->first('title', '<span class="form-error">:message</span>') !!}
              </div>
            </div>
          </div>
          <div class="card bg shadow mb-4 py-3" style="background-color:#f8f9fc">
            <div class="card-body">
              <div class="font-weight-bold text-primary small mb-3">내용</div>
              <div class="form-group" style="margin-bottom:0px">
                <textarea name="body" class="form-control form-control-user" rows="8" cols="80" placeholder="알림 내용을 입력해주세요." required>{{ old('body') }}</textarea>
                {!! $errors->first('body', '<span class="form-error">:message</span>') !!}
              </div>
            </div>
          </div>
          <div class="input-group">
            <button style="margin-left: auto;" class="btn btn-primary">발송 하기</button>
          </div>
        </form>
      </div>
    </div>
  </div>
@endsection

@section('js')
  <script type="text/javascript">
    $(function(){
      function check(){
        if($("input[name=title]").val() == ""){
          alert("제목을 입력해주세요.");
          return false;
        }
        if($("input[name=body]").val() == ""){
          alert("내용을 입력해주세요.");
          return false;
        }
      }
    });

    $(function(){
      $('#all').click(function(){
        $('.user').hide();
        $('.doctor').hide();
      });

      $('#user').click(function(){
        $('.user').show();
        $('.doctor').hide();
      });

      $('#doctor').click(function(){
        $('.user').hide();
        $('.doctor').show();
      });
    });

    sojaeji();
  </script>
@endsection

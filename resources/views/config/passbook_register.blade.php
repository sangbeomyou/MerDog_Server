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
    <h1 class="h3 mb-2 text-gray-800">설정</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 설정 >> 무통장 입금 계좌 등록</p>

    <!-- 수정창 -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">계좌 등록</h6>
      </div>
      <div class="card-body mb-3">
        <form action={{ route("config.passbook_register_success") }} method="post" onsubmit="return registerID();">
          @csrf
          <div class="input-group row mb-3" style="width:40%;">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">은행명</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <select class="form-control" name="bank_name" required>
                <option value="">카드 선택</option>
								<option value="CCDI">현대카드</option>
								<option value="CCLO">롯데카드</option>
								<option value="CCLG">신한카드</option>
								<option value="CCSS">삼성카드</option>
								<option value="CCHN">하나카드</option>
								<option value="CCKE">하나(외환)</option>
								<option value="CCKM">KB 국민</option>
								<option value="CCNH">NH채움</option>
								<option value="CCBC">비씨카드</option>
								<option value="CCPH">우리카드</option>
								<option value="CCCT">씨티카드</option>
								<option value="CCSU">수협카드</option>
								<option value="CCSM">MG새마을</option>
								<option value="CCCJ">제주카드</option>
								<option value="BC81">하나 BC</option>
								<option value="CCJB">전북카드</option>
								<option value="CCCU">신협카드</option>
								<option value="CCPB">우체국카드</option>
								<option value="CCKJ">광주카드</option>
								<option value="CCKD">KDB산업</option>
								<option value="CCSB">저축은행</option>
								<option value="CCHS">KB증권(현대증권)</option>
								<option value="CCKA">카카오뱅크</option>
								<option value="CCKK">케이뱅크</option>
							</select>
                <option value="국민은행">국민은행</option>
                <option value="신한은행">신한은행</option>
                <option value="우리은행">우리은행</option>
              </select>
              {{-- <input type="text" class="form-control" name="bank_name" value="" required> --}}
              {!! $errors->first('bank_name', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="input-group row mb-3" style="width:40%;">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">계좌 번호</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <input type="number" class="form-control" name="bank_number" value="" required>
              {!! $errors->first('bank_number', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="input-group row mb-3" style="width:40%;">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">예금주</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <input type="text" min="0" class="form-control" name="bank_depo" value="" required>
              {!! $errors->first('bank_depo', '<span class="form-error">:message</span>') !!}
            </div>
          </div>

          <div class="btn section" style="float: right;padding-right: 0px;border-right-width: 0px;">
            {{-- 등록 --}}
            <button type="submit" class="btn btn-primary">계좌 등록</button>
            {{-- 돌아가기 --}}
            <a href="{{ route("config.passbook_config") }}" class="btn btn-secondary btn-icon-split">
              <span class="text"><i class="fas fa-arrow-left">&nbsp</i>돌아가기</span>
            </a>
          </div>
        </form>
      </div>
    </div>
  </div>
@endsection

@section('js')
  <script type="text/javascript">
    function registerID(){
      var stop = confirm("해당 계좌를 등록 하시겠습니까?");
      if(!stop){
        return false;
      }else{
        alert("해당 계좌가 등록되었습니다.");
      }
    }
  </script>
@endsection

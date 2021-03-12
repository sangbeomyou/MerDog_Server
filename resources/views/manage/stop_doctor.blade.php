@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0];
  var index = 13;
  var type = 'normal'
  var footer = 0;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2,3,4,5,6,7,8,9,10,11,12,13];
  var title = '의사 회원 <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">회원 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 의사 회원 >> 정지 회원 </p>


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


    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">[의사 회원] 정지 회원 목록</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th width="%">NO.</th>
                <th width="5%">회원번호</th>
                <th width="7%">ID</th>
                <th width="7%">카카오 ID</th>
                <th width="7%">네이버 ID</th>
                <th width="7%">이름</th>
                <th width="8%">전화 번호</th>
                <th width="5%">평점</th>
                <th width="8%">상담횟수</th>
                <th width="6%">수수료</th>
                <th width="8%">보유 마일리지</th>
                <th width="8%">출금 마일리지</th>
                <th width="8%">총 마일리지</th>
                <th width="%">등록일</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($doctors as $i=>$doctor)
                @php
                  $chat_count = \App\chat_request::where('doctor_id',$doctor->id)->whereIn('state',['ing','finish'])->count();
                  $rating = \App\chat_request::where([['doctor_id',$doctor->id],['state','finish'],['rating','<>',NULL]])->avg('rating');
                  $get_money = \App\withdraw_list::where([['doctor_id',$doctor->id],['state','complete']])->sum("price");
                  $price = \App\accumulate::where('doctor_id',$doctor->id)->sum('point');
                @endphp
                <tr onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#d7e9fb')" style="cursor:pointer">
                  <td>{{ ++$i }}</td>
                  <td>{{ $doctor->id }}</td>
                  <td>{{ isset($doctor->doctor_id) ? $doctor->doctor_id : "-"}}</td>
                  <td>{{ isset($doctor->doctor_kakao) ? $doctor->doctor_kakao : "-"}}</td>
                  <td>{{ isset($doctor->doctor_naver) ? $doctor->doctor_naver : "-"}}</td>
                  <td>{{ $doctor->doctor_name }}</td>
                  <td>{{ $doctor->doctor_phone }}</td>
                  <td>{{ isset($rating) ? number_format($rating,'1')." 점" : "-" }}</td>
                  <td>{{ number_format($chat_count) }}</td>
                  <td>{{ $doctor->fee }} %</td>
                  <td>&#8361; {{ number_format($price - $get_money) }}</td>
                  <td>&#8361; {{ number_format($get_money) }}</td>
                  <td>&#8361; {{ number_format($price) }}</td>
                  <td>{{ $doctor->created_at }}</td>
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
          <h5 class="modal-title title" id="exampleModalLabelh5">전체 수수료 조정</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <form action="{{ route('manage.doctor_fee') }}" method="post">
          @csrf
          <div class="modal-body">
            <h1 class="h5 text-gray-900 mt-0">조건별</h1>

            <div class="form-group" style="overflow:hidden">
              <div class="custom-control custom-radio" style="width:50%; float:left">
                <input type="radio" class="custom-control-input" id="all" name="type" value="all" checked>
                <label class="custom-control-label" for="all">전체</label>
              </div>
              <div class="custom-control custom-radio" style="width:50%; float:left">
                <input type="radio" class="custom-control-input" id="count" name="type" value="count">
                <label class="custom-control-label" for="count">상담횟수</label>
              </div>
              <div class="custom-control custom-radio"style="width:50%; float:left">
                <input type="radio" class="custom-control-input" id="rating" name="type" value="rating">
                <label class="custom-control-label" for="rating">평점</label>
              </div>
              <div class="custom-control custom-radio"style="width:50%; float:left">
                <input type="radio" class="custom-control-input" id="both" name="type" value="both">
                <label class="custom-control-label" for="both">상담횟수 & 평점</label>
              </div>
            </div>

            <div class="form-group count" style="display:none">
              <div class="h5">상담횟수 입력</div>
              <div class="h5 small" style="color:red">※입력한 값 기준 - 같거나 큰 값에 적용※</div>
              <input type="number" min="1" name="count" class="form-control form-control-user" placeholder="적용 할 수수료를 입력해주세요" value="{{ old('count') }}">
              {!! $errors->first('count', '<span class="form-error">:message</span>') !!}
            </div>
            <div class="form-group rating" style="display:show">
              <div class="h5">평점 입력</div>
              <div class="h5 small" style="color:red">※입력한 값 기준 - 같거나 큰 값에 적용※</div>
              <input type="number" min="0.1" max="5" step="0.1" name="rating" class="form-control form-control-user" placeholder="적용 할 수수료를 입력해주세요" value="{{ old('rating') }}">
              {!! $errors->first('rating', '<span class="form-error">:message</span>') !!}
            </div>
            <hr>
            <h1 class="h5 text-gray-900 mt-2">적용 할 수수료 (%) 입력</h1>
            <div class="form-group">
              <input type="number" min="1" max="100" name="fee" class="form-control form-control-user" placeholder="적용 할 수수료를 입력해주세요" value="{{ old('fee') }}" required>
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


      //데이터테이블 셀렉트 옵션 추가
      $(document).ready( function() {
        $('#select').append('<option value="2">ID</option>');
        $('#select').append('<option value="3">카카오 ID</option>');
        $('#select').append('<option value="4">네이버 ID</option>');
        $('#select').append('<option value="5">이름</option>');
        $('#select').append('<option value="6">전화번호</option>');
        $('#select').append('<option value="7">평점</option>');
      });


    //데이터 테이블 날짜 검색 칼럼번호 설정
    $.fn.dataTable.ext.search.push(
      function(settings, data, dataIndex){
        var min = Date.parse($('#date_from').val());
        var max = Date.parse($('#date_to').val());
        var target = data[13];
        var targetDate = Date.parse(target.substring(0, 11));

        if( (isNaN(min) && isNaN(max) ) ||
            (isNaN(min) && targetDate <= max )||
            ( min <= targetDate && isNaN(max) ) ||
            ( targetDate >= min && targetDate <= max) ){
          return true;
        }
        return false;
      }
    )
    $(function(){
      $('#modal').click(function(){
        $("#all").prop('checked', true);
        $('input[name=count]').val("");
        $('input[name=rating]').val("");
        $('input[name=fee]').val("");
        $('.count').hide();
        $('.rating').hide();
      });

      $('#all').click(function(){
        $('input[name=count]').val("");
        $('input[name=rating]').val("");
        $('.count').hide();
        $('.rating').hide();
      });

      $('#count').click(function(){
        $('input[name=count]').val("");
        $('input[name=rating]').val("");
        $('.count').show();
        $('.rating').hide();
      });

      $('#rating').click(function(){
        $('input[name=count]').val("");
        $('input[name=rating]').val("");
        $('.count').hide();
        $('.rating').show();
      });

      $('#both').click(function(){
        $('input[name=count]').val("");
        $('input[name=rating]').val("");
        $('.count').show();
        $('.rating').show();
      });
    });
  </script>
@endsection

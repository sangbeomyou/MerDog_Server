@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0,7,9,10];
  var index = 8;
  var type = 'normal'
  var footer = 0;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2,3,4,5,6,8];
  var title = '승인 대기 [의사] <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">승인 대기</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 의사 회원 </p>


    <!-- 검색창 Example -->
    <div class="card shadow mb-4" >
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
        <h6 class="m-0 font-weight-bold text-primary">[의사 회원] 승인 대기 목록</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th width="5%">NO.</th>
                <th width="10%">회원번호</th>
                <th width="10%">ID</th>
                <th width="12%">카카오 ID</th>
                <th width="12%">네이버 ID</th>
                <th width="10%">이름</th>
                <th width="10%">전화번호</th>
                <th width="5%">자격증 정보</th>
                <th width="10%">등록일</th>
                <th width="8%">승인</th>
                <th width="8%">거부</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($doctors as $i=>$doctor)
                <tr onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#d7e9fb')" style="cursor:default">
                  @php
                    $license = \App\license::where('doctor_id',$doctor->id)->get();
                  @endphp
                  <td>{{ ++$i }}</td>
                  <td>{{ $doctor->id }}</td>
                  <td>{{ isset($doctor->doctor_id) ? $doctor->doctor_id : "-"}}</td>
                  <td>{{ isset($doctor->doctor_kakao) ? $doctor->doctor_kakao : "-"}}</td>
                  <td>{{ isset($doctor->doctor_naver) ? $doctor->doctor_naver : "-"}}</td>
                  <td>{{ $doctor->doctor_name }}</td>
                  <td>{{ $doctor->doctor_phone }}</td>
                  <td><a onclick="show('{{ $doctor->doctor_id }}','{{ $doctor->doctor_name }}',
                    '{{ isset($license['0']['img_name']) ? $license['0']['img_name']:"" }}',
                    '{{ isset($license['1']['img_name']) ? $license['1']['img_name']:""  }}');
                    "class="dropdown-item" href="#" data-toggle="modal" data-target="#Modal" style="color:blue; text-decoration:underline"><보기></a></td>
                  <td>{{ $doctor->created_at }}</td>
                  <td>
                    <form action="{{ route("manage.wait_doctor.update") }}" method="post">
                      @csrf
                      <input type="hidden" name="id" value="{{ $doctor->id }}">
                      <button class="btn btn-success btn-circle btn-sm" type="submit">
                        <i class="fas fa-check"></i>
                      </button>
                    </form>
                  </td>
                  <td>
                    <form onsubmit="return confirms();" action="{{ route("manage.wait_doctor.delete") }}" method="post">
                      @csrf
                      <input type="hidden" name="id" value="{{ $doctor->id }}">
                      <button class="btn btn-danger btn-circle btn-sm" type="submit">
                        <i class="fas fa-trash"></i>
                      </button>
                    </form>
                  </td>
                  <input type="hidden" id="doctor_id" value="{{ $doctor->id }}">
                </tr>
              @endforeach
            </tbody>
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
          <h5 class="modal-title title" id="exampleModalLabelh5"></h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">
          <button id="rotate_doctor" class="btn btn-secondary"><i class="fas fa-redo-alt"></i></button>
          <div id="doctor_license" style="text-align:center">
            <div>수의사 자격증</div>
          </div>
          <hr color="black" size="3">
          <button id="rotate_user" class="btn btn-secondary"><i class="fas fa-redo-alt"></i></i></button>
          <div id="user_license" style="text-align:center">
            <div>신분증</div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">돌아가기</button>
        </div>
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

    // 현재의 각도를 변수로 저장
    var angle = 0;
    var angle2 = 0;

    //모달에 이미지 할당
    function show(id, name, user, doctor) {
      $("#doctor_license img").remove();
      var input_doctor = '<img id="doctor_img" src="{{asset("storage/img/license")}}/'+doctor+'" alt="수의사 자격증" style="width:70%;">'
      $("#doctor_license").append(input_doctor);

      $("#user_license img").remove();
      var input_user = '<img id="user_img" src="{{asset("storage/img/license")}}/'+user+'" alt="신분증" style="width:70%;">'
      $("#user_license").append(input_user);

      $(".title").html("ID: "+id+", "+name+" 님의 자격증 정보");

      angle = 0;
      angle2 = 0;
    }

    //이미지 회전
    $(function(){
      angle = 0;
      angle2 = 0;
      $('#rotate_doctor').click(function() {
        angle += +90;
        $("#doctor_img").css('transform','rotate('+angle+'deg)');
        // $("#doctor_img").rotate("90deg");
      });
      $('#rotate_user').click(function() {
        angle2 += +90;
        $("#user_img").css('transform','rotate('+angle2+'deg)');
        // $("#doctor_img").rotate("90deg");
      });
    });

    //거부 시 confirm 박스
    function confirms() {
      var con = confirm("거부 하시겠습니까?");
      if(con == false){
        return false;
      }
    }

    //데이터테이블 셀렉트 옵션 추가
    $(document).ready( function() {
    $('#select').append('<option value="2">ID</option>');
    $('#select').append('<option value="3">카카오 ID</option>');
    $('#select').append('<option value="4">네이버 ID</option>');
    $('#select').append('<option value="5">이름</option>');
  });


  //데이터 테이블 날짜 검색 칼럼번호 설정
  $.fn.dataTable.ext.search.push(
      function(settings, data, dataIndex){
          var min = Date.parse($('#date_from').val());
          var max = Date.parse($('#date_to').val());
          var target = data[8];
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

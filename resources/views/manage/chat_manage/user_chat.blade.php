@extends('layouts.layout_main')

@section('datatable_setting')
  <? $curDate = date('Y-m-d'); ?>
  var no_order = [0];
  var index = 1;
  var type = 'normal'
  var footer = 0;
  var footer_get_money = 0;
  var footer_price = 0;
  var footer_state = 0;
  var excel = [1,2,3,4,5,6,7];
  var title = '회원별 상담 관리 (일반) <?php echo json_encode($curDate); ?>';
@endsection

@section('content')
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">상담 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 회원별 상담 >> 일반 회원 </p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">[일반 회원] 상담 내역 목록</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table table-bordered" id="dataTable" style="text-align:center; font-size: small;" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th width="5%">NO.</th>
                <th width="10%">회원번호</th>
                <th width="10%">ID</th>
                <th width="10%">카카오 ID</th>
                <th width="10%">네이버 ID</th>
                <th width="10%">닉네임</th>
                <th width="10%">전화 번호</th>
                <th width="10%">상담 횟수</th>
              </tr>
            </thead>
            <tbody>
              @foreach ($user_chats as $i=>$user)
              @php
                $chat_count = \App\chat_request::where('user_id',$user->id)->whereIn('state',['ing','finish'])->count();
              @endphp
              <tr onclick="location.href='{{ route("manage.user_chat_detail", ["id" => $user->id]) }}'" onmouseover="javascript:changeTrColor(this, '#FFFFFF', '#d7e9fb')" style="cursor:pointer">
                <td>{{ ++$i }}</td>
                <td>{{ $user->id }}</td>
                <td>{{ isset($user->user_id) ? $user->user_id : "-"}}</td>
                <td>{{ isset($user->user_kakao) ? $user->user_kakao : "-"}}</td>
                <td>{{ isset($user->user_naver) ? $user->user_naver : "-"}}</td>
                <td>{{ $user->user_nick }}</td>
                <td>{{ $user->user_phone }}</td>
                <td>{{ number_format($chat_count) }}</td>
              </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

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

      //데이터테이블 셀렉트 옵션 추가
      $(document).ready( function() {
        $('#select').append('<option value="1">회원번호</option>');
        $('#select').append('<option value="2">ID</option>');
        $('#select').append('<option value="3">카카오 ID</option>');
        $('#select').append('<option value="4">네이버 ID</option>');
        $('#select').append('<option value="5">이름</option>');
        $('#select').append('<option value="6">전화 번호</option>');
      });
  </script>
@endsection

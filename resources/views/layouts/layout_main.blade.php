<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>{{ config('app.name', 'Laravel') }}</title>

  <!-- Custom fonts for this template-->
  <link href="{{ asset('vendor/fontawesome-free/css/all.min.css') }}" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="{{ asset('css/sb-admin-2.min.css') }}" rel="stylesheet">

  <!-- 데이터 테이블 css -->
  <link href="{{ asset('vendor/datatables/dataTables.bootstrap4.min.css') }}" rel="stylesheet">
  <link href="{{ asset('https://cdn.datatables.net/buttons/1.6.1/css/buttons.dataTables.min.css') }}" rel="stylesheet">

  <!-- 데이트피커 css -->
  <link href="{{ asset('css/datepicker.min.css') }}" rel="stylesheet">

  <!-- 멀티셀렉트 -->
  <link type="text/css" rel="Stylesheet" href="{{ asset('css/bootstrap-duallistbox.min.css') }}" />
  {{-- <link rel="stylesheet" type="text/css" href="../src/bootstrap-duallistbox.css"> --}}

  <style media="screen">
    tfoot { font-size: medium};
  </style>
  @yield('css')
</head>
  <body id="page-top">
      @include('flash::message')
    <!-- Page Wrapper -->
    <div id="wrapper">
      <!-- Sidebar -->
      <ul class="navbar-nav bg-gradient-primary fixed sidebar sidebar-dark accordion" id="accordionSidebar" style="z-index:20">
        <!-- Sidebar - Brand -->
        <a class="sidebar-brand d-flex align-items-center justify-content-center" href={{ route('home') }}>
          <div class="sidebar-brand-text">MerDog</div>
          <div class="sidebar-brand-icon mx-3">Admin</div>
        </a>
        <!-- Divider -->
        <hr class="sidebar-divider my-0">
        <!-- Divider -->
        <hr class="sidebar-divider my-0">

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
          <a class="nav-link" href={{ route('home')}}>
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
          </a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider">

        <!-- Heading -->
        <div class="sidebar-heading">
          Manage
        </div>
        <!-- Nav Item - 회원관리 Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUser" aria-expanded="true" aria-controls="collapseUser">
            <i class="fas fa-fw fa-user"></i>
            <span>회원 관리</span>
          </a>
          <div id="collapseUser" class="collapse" aria-labelledby="headingUser" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="{{ route("manage.user") }}">일반 회원</a>
              <a class="collapse-item" href="{{ route("manage.doctor") }}">의사 회원</a>
              <a class="collapse-item" href="{{ route("manage.admin") }}">관리자</a>
            </div>
          </div>
        </li>
        <!-- Nav Item - 신천현황 Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseApply" aria-expanded="true" aria-controls="collapseApply">
            <i class="fas fa-fw fa-hourglass-half"></i>
            <span>승인 대기</span>
          </a>
          <div id="collapseApply" class="collapse" aria-labelledby="headingApply" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="{{ route('manage.wait_doctor') }}">의사 회원</a>
              <a class="collapse-item" href="{{ route('manage.wait_admin') }}">관리자</a>
            </div>
          </div>
        </li>
        <!-- Nav Item - 채팅관리 -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseChat" aria-expanded="true" aria-controls="collapseChat">
            <i class="fas fa-fw fa-comments"></i>
            <span>상담 관리</span>
          </a>
          <div id="collapseChat" class="collapse" aria-labelledby="headingApply" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="{{ route('manage.chat') }}">요청별 상담</a>
              <hr style="margin:8px">
              <div style="border-bottom:2px solid rgba(0, 0, 0, 0.2); padding:7px; margin:8px">회원별 상담</div>
              <a class="collapse-item" href="{{ route('manage.user_chat') }}">일반 회원</a>
              <a class="collapse-item" href="{{ route('manage.doctor_chat') }}">의사 회원</a>
            </div>
          </div>
        </li>
        {{-- <li class="nav-item">
          <a class="nav-link" href="{{ route('manage.chat') }}">
            <i class="fas fa-fw fa-comments"></i>
            <span>상담 관리</span></a>
        </li> --}}
        <!-- Nav Item - 결제관리 Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePayment" aria-expanded="true" aria-controls="collapsePayment">
            <i class="fas fa-fw fa-dollar-sign"></i>
            <span>결제 관리</span>
          </a>
          <div id="collapsePayment" class="collapse" aria-labelledby="headingPayment" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <div style="border-bottom:2px solid rgba(0, 0, 0, 0.2); padding:7px; margin:8px">일반 회원</div>
              <a class="collapse-item" href="{{ route('manage.payment_manage.payment') }}">결제 내역</a>
              {{-- <a class="collapse-item" href="{{ route('manage.payment_manage.passbook') }}">무통장 결제 신청 내역</a> --}}
              <a class="collapse-item" href="{{ route('manage.payment_manage.refund') }}">환불 신청 내역</a>
              <hr style="margin:8px">
              <div style="border-bottom:2px solid rgba(0, 0, 0, 0.2); padding:7px; margin:8px">의사 회원</div>
              <a class="collapse-item" href="{{ route('manage.payment_manage.withdraw') }}">출금 내역</a>
              <a class="collapse-item" href="{{ route('manage.payment_manage.withdraw_request') }}">출금 신청 내역</a>
              {{-- {{ route('manage.pay') }}
              {{ route('manage.withdraw') }}
              {{ route('manage.withdraw_request') }} --}}
            </div>
          </div>
        </li>
        <!-- Nav Item - 상품 내역 Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseProduct" aria-expanded="true" aria-controls="collapseProduct">
            <i class="fas fa-fw fa-gift"></i>
            <span>상품 관리</span>
          </a>
          <div id="collapseProduct" class="collapse" aria-labelledby="headingProduct" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="{{ route('manage.product_manage.product') }}">상품 내역</a>
              <a class="collapse-item" href="{{ route('manage.product_manage.product_register') }}">상품 등록</a>
            </div>
          </div>
        </li>
        <!-- Nav Item - 로그 Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLog" aria-expanded="true" aria-controls="collapseLog">
            <i class="fas fa-fw fa-clipboard-list"></i>
            <span>로그 관리</span>
          </a>
          <div id="collapseLog" class="collapse" aria-labelledby="headingLog" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="{{ route('log.login_log') }}">로그인 로그</a>
              <a class="collapse-item" href="{{ route('log.fcm_log') }}">FCM 발송 로그</a>
              <a class="collapse-item" href="{{ route('log.sms_log') }}">SMS 발송 로그</a>
            </div>
          </div>
        </li>
        <!-- Nav Item - 설정 Menu -->
        <li class="nav-item">
          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseConfig" aria-expanded="true" aria-controls="collapseConfig">
            <i class="fas fa-fw fa-cog"></i>
            <span>설정</span>
          </a>
          <div id="collapseConfig" class="collapse" aria-labelledby="headingConfig" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              {{-- <a class="collapse-item" href="{{ route('config.passbook_config') }}">무통장 계좌 설정</a> --}}
              <a class="collapse-item" href="{{ route('config.fcm') }}">FCM 발송</a>
            </div>
          </div>
        </li>
        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block">
        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
          <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
      </ul>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column" style="height:100vh;">
        <!-- Main Content -->
        <div id="content">
          <!-- Topbar -->
          <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

            <ul class="navbar-nav ml-auto">
              <!-- Nav Item - User Information -->
              <li class="nav-item dropdown no-arrow">
                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  @php
                  $level = \App\admin_info::join('level_list','admin_info.level','=','level_list.id')->where('admin_info.id',auth()->user()->id)->get();
                  @endphp
                  <span class="mr-2 d-lg-inline text-gray-900">{{ auth()->user()->admin_id }}님 [{{ $level['0']['level'] }}] </span>
                </a>
                <!-- Dropdown - User Information -->
                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                  <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                  </a>
                </div>
              </li>
            </ul>

            <!-- Sidebar Toggle (Topbar) -->
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
              <i class="fa fa-bars"></i>
            </button>
          </nav>
          <!-- End of Topbar -->

          <!-- Begin Page Content -->
          <!--내용 시작 부분-->
          @yield('content')
          <!--내용 완료 부분-->
          <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright &copy; MerDog CCIT 2019</span>
            </div>
          </div>
        </footer>
        <!-- End of Footer -->

      </div>
      <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">로그아웃을 누르시면 현재 페이지를 벗어나게 됩니다.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
            <a class="btn btn-primary" href="{{ route('logout') }}">로그아웃</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="{{ asset('vendor/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

    <!-- Core plugin JavaScript-->
    <script src="{{ asset('vendor/jquery-easing/jquery.easing.min.js') }}"></script>

    <!-- Custom scripts for all pages-->
    <script src="{{ asset('js/sb-admin-2.min.js') }}"></script>

    <!-- Page level plugins -->
    <script src="{{ asset('vendor/chart.js/Chart.min.js') }}"></script>

    {{-- <!-- Page level custom scripts --> --}}
    {{-- <script src="{{ asset('js/demo/chart-area-demo.js') }}"></script>
    <script src="{{ asset('js/demo/chart-pie-demo.js') }}"></script> --}}

    <!--멀티셀렉트js -->
    <script type="text/javascript" src="{{ asset('js/jquery.bootstrap-duallistbox.min.js') }}"></script>

    <!--데이터 테이블 js -->
    <script src="{{ asset('vendor/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('vendor/datatables/dataTables.bootstrap4.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js') }}"></script>
    <script type="text/javascript" src="{{ asset('https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js') }}"></script>
    <script type="text/javascript">
      @yield('datatable_setting')
    </script>
    <script src="{{ asset('js/demo/datatables-demo.js') }}"></script>
    <script src="{{ asset('js/demo/sojaeji.js') }}"></script>
    <!--데이트피커 js -->
    <script src="{{ asset('js/datepicker.js') }}"></script>
    <script src="{{ asset('js/datepicker.ko-KR.js') }}"></script>
    <script>
      var msg = '{{Session::get('alert')}}';
      var exist = '{{Session::has('alert')}}';
      if(exist){
        alert(msg);
      }
    </script>

    <!--데이트피커 스크립트 -->
    <script>
    var d = new Date();

    var year = d.getFullYear(); // 년도
    var month = d.getMonth() + 1;  // 월
    var date = d.getDate();  // 날짜
    var day = d.getDay();  // 요일

    var today = year+'-'+month+'-'+date;

    $(function() {
      $('[data-toggle = "datepicker"]').datepicker({
        autoHide: true,
        zIndex: 2048,
        language: 'ko-KR',
        startDate: '1980-01-01',
        endDate: '2020-12-31',
      });
      $("#date_from").datepicker('setEndDate', $("#date_to").val());
      $("#date_to").datepicker('setStartDate', $("#date_from").val());
      $("#date_to").datepicker('setEndDate', today);
    });

    $('[data-toggle = "datepicker"]').click(function() {
      $('[data-toggle = "datepicker"]').datepicker({
        zIndex: 2048,
        language: 'ko-KR',
        startDate: '1980-01-01',
        endDate: '2020-12-31',
      });
      $("#date_from").datepicker('setEndDate', $("#date_to").val());
      $("#date_to").datepicker('setStartDate', $("#date_from").val());
      $("#date_to").datepicker('setEndDate', today);
    });
  </script>

  <!--날짜 자동입력 스크립트 -->
  <script>
  function setSearchDate(num){
    var table_date = $('#dataTable').DataTable();
    // datepicker period
    <? $curDate = date('Y-m-d'); ?>
    <? $curDate1 = date("Y-m-d",strtotime("-1 days"));?>
    <? $curDate2 = date("Y-m-d",strtotime("-6 days"));?>
    <? $d = mktime(0,0,0, date("m"), 1, date("Y"));
        $prev_month = strtotime("-1 month", $d); ?>
    <? $curDate3 = date("Y-m-01") ;?>
    <? $curDate4 = date("Y-m-d",strtotime("-1 months"));?>
    <? $curDate5 = date("Y-m-d",strtotime("-3 months"));?>

    switch(num){
      case 0:
      $("#date_from").datepicker('setDate', <?php echo json_encode($curDate); ?>);
      $("#date_to").datepicker('setDate', <?php echo json_encode($curDate); ?>);
      var search_data = $('.dataTables_filter input').val();
      table_date.draw();
      $('.dataTables_filter input').attr('value',search_data);
      break;

      case 1:
      $("#date_from").datepicker('setDate', <?php echo json_encode($curDate1); ?>);
      $("#date_to").datepicker('setDate', <?php echo json_encode($curDate); ?>);
      var search_data = $('.dataTables_filter input').val();
      table_date.draw();
      $('.dataTables_filter input').attr('value',search_data);
      break;

      case 2:
      $("#date_from").datepicker('setDate', <?php echo json_encode($curDate2); ?>);
      $("#date_to").datepicker('setDate', <?php echo json_encode($curDate); ?>);
      var search_data = $('.dataTables_filter input').val();
      table_date.draw();
      $('.dataTables_filter input').attr('value',search_data);
      break;

      case 3:
      $("#date_from").datepicker('setDate', <?php echo json_encode($curDate3); ?>);
      $("#date_to").datepicker('setDate', <?php echo json_encode($curDate); ?>);
      var search_data = $('.dataTables_filter input').val();
      table_date.draw();
      $('.dataTables_filter input').attr('value',search_data);
      break;

      case 4:
      $("#date_from").datepicker('setDate', <?php echo json_encode($curDate4); ?>);
      $("#date_to").datepicker('setDate', <?php echo json_encode($curDate); ?>);
      var search_data = $('.dataTables_filter input').val();
      table_date.draw();
      $('.dataTables_filter input').attr('value',search_data);
      break;

      case 5:
      $("#date_from").datepicker('setDate', <?php echo json_encode($curDate5); ?>);
      $("#date_to").datepicker('setDate', <?php echo json_encode($curDate); ?>);
      var search_data = $('.dataTables_filter input').val();
      table_date.draw();
      $('.dataTables_filter input').attr('value',search_data);
      console.log(search_data);
      break;

      default: return 0;
      break;
    }
  }
  </script>
  @yield('js')

  {{-- 엑셀버튼 속성 제거 --}}
  <script type="text/javascript">
    $(function(){
      $('button').removeClass('dt-button');
    })
  </script>

  {{-- 데이터테이블 검색 값 남기기 --}}
  <script type="text/javascript">
    $('.dataTables_filter input').val('{{ old("search") }}');

  </script>
</body>
</html>

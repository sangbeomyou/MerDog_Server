@extends('layouts.layout_main')

@section('content')
  <div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">대시보드</h1>
      <input type="hidden" name="date" value="{{ $date }}">
      <input type="hidden" name="move" value="{{ $move }}">
      @php
      $yoil = array("일","월","화","수","목","금","토");
      $curDate = date('Y-m-d');
      if ($date == "week") {
        if(isset($move)){
          $curDate = date("Y-m-d", strtotime($curDate.$move*(7)."day"));
        }
        $tomorrow = date("Y-m-d", strtotime($curDate."+1 day"));

        $today_num = date('w'); //요일을 숫자로 표시 일:0, 월:1, 화:2, 수:3, 목:4, 금:5, 토:6
        if($today_num == "1"){
          $startDate = date("Y-m-d", strtotime($tomorrow."last monday"));
          $endDate = date("Y-m-d", strtotime($curDate."next sunday"));
        }elseif($today_num == "0"){
          $startDate = date("Y-m-d", strtotime($curDate."last monday"));
          $endDate = date("Y-m-d", strtotime($tomorrow."last sunday"));
        }else{
          $startDate = date("Y-m-d", strtotime($curDate."last monday"));
          $endDate = date("Y-m-d", strtotime($curDate."next sunday"));
        }
      }elseif ($date == "month") {
        if(isset($move)){
          $curDate = date("Y-m-d", strtotime($curDate.$move." month"));
        }
        $startDate = date("Y-m-01", strtotime($curDate));
        $endDate = date("Y-m-t", strtotime($curDate));
      }else{
        if(isset($move)){
          $curDate = date("Y-m-d", strtotime($curDate.$move." day"));
        }
        $tomorrow = date("Y-m-d", strtotime($curDate."+1 day"));
        $startDate = $curDate;
        $endDate = $curDate;
      }
        // $curDate = date("Y-m-d", strtotime($curDate." -1 day"));
      @endphp
    <div class="mb-4 text-gray-800" style="text-align:center">
      @if ($date == "week")
        <h3> <button class="btn btn-success btn-sm" type="button" name="previous"><</button>
          {{ $startDate." (월) ~ ".$endDate." (일)"  }}
          <button class="btn btn-success btn-sm" type="button" name="next">></button>
        </h3>
        <button class="btn btn-info btn-sm" type="button" name="day">일</button>
        <button class="btn btn-primary btn-sm" type="button" name="week">주</button>
        <button class="btn btn-info btn-sm" type="button" name="month">월</button>
      @elseif ($date == "month")
        <h3> <button class="btn btn-success btn-sm" type="button" name="previous"><</button>
          {{ date("Y-m", strtotime($curDate))."월"  }}
          <button class="btn btn-success btn-sm" type="button" name="next">></button>
        </h3>
        <button class="btn btn-info btn-sm" type="button" name="day">일</button>
        <button class="btn btn-info btn-sm" type="button" name="week">주</button>
        <button class="btn btn-primary btn-sm" type="button" name="month">월</button>
      @else 
        <h3> <button class="btn btn-success btn-sm" type="button" name="previous"><</button>
          {{ $curDate." (".$yoil[date('w', strtotime($curDate))].")" }}
          <button class="btn btn-success btn-sm" type="button" name="next">></button>
        </h3>
        <button class="btn btn-primary btn-sm" type="button" name="day">일</button>
        <button class="btn btn-info btn-sm" type="button" name="week">주</button>
        <button class="btn btn-info btn-sm" type="button" name="month">월</button>
      @endif
    </div>

    <!-- 통계 건수 & 금액 row -->
    <div class="row">
      @php
        $doctor = \App\doctor_info::whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->count();
        $chat = \App\chat_request::whereIn('state',['ing','finish'])->whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->count();
        $login = \App\login_log::whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->groupBy('id_type','login_id')->get()->count();
        // $login = \App\login_log::distinct('user_id')->where('created_at','like',$curDate.'%')->count();
        $session = \App\login_log::whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->groupBy(DB::raw("date_format(created_at,'%Y-%m-%d')"),'id_type','login_id','ip_address')->get()->count();
        // $session = \App\login_log::distinct('ip_address')->where('created_at','like',$curDate.'%')->count();
        $payment = \App\payment_list::where('state','complete')->whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->count();
        $refund = \App\refund_list::where('state','wait')->whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->count();
        $withdraw = \App\withdraw_list::where('state','wait')->whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->count();
        $refund_complete = \App\refund_list::where('state','complete')->whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->count();
        $withdraw_complete = \App\withdraw_list::where('state','complete')->whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->count();
        $payments = \App\payment_list::where('state','complete')->whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->get();
        $refunds = \App\refund_list::where('state','complete')->whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->get();
        $withdraws = \App\withdraw_list::where('state','complete')->whereBetween('created_at',[$startDate.' 00:00:00',$endDate.' 23:59:59'])->get();
        $payment_money = 0;
        $refund_money = 0;
        $withdraw_money = 0;
        $payment_moneys = array();
        $refund_moneys = array();
        $withdraw_moneys = array();
        $login_count = array();
        $session_count = array();
        $week_day = 0;


        foreach ($payments as $key => $value) {
          $product = \App\product::where('id',$value->product_id)->value('price');
          $payment_money += $product;
        }

        foreach ($refunds as $key => $value) {
          $payment_whithdraw = \App\payment_list::where('id',$value->payment_id)->value('product_id');
          $product = \App\product::where('id',$payment_whithdraw)->value('price');
          $refund_money += $product;
        }

        foreach ($withdraws as $key => $value) {
          $money = \App\withdraw_list::where('state','complete')->value('get_money');
          $withdraw_money += $money;
        }

        for($i=0;$i<7;$i++)
        {
          $payment_money_chart = 0;
          $refund_money_chart = 0;
          $withdraw_money_chart = 0;
          if ($date == 'week') {
            $payments_chart = \App\payment_list::where('state','complete')->whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$week_day." day")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$week_day." day")).' 23:59:59'])->get();
            $refunds_chart = \App\refund_list::where('state','complete')->whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$week_day." day")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$week_day." day")).' 23:59:59'])->get();
            $withdraws_chart = \App\withdraw_list::where('state','complete')->whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$week_day." day")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$week_day." day")).' 23:59:59'])->get();
            $login_chart = \App\login_log::whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$week_day." day")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$week_day." day")).' 23:59:59'])->groupBy('id_type','login_id')->get()->count();
            $session_chart = \App\login_log::whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$week_day." day")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$week_day." day")).' 23:59:59'])->groupBy(DB::raw("date_format(created_at,'%Y-%m-%d')"),'id_type','login_id','ip_address')->get()->count();
          }
          else if ($date == 'month') {
            $payments_chart = \App\payment_list::where('state','complete')->whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$i." months")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$i." months")).' 23:59:59'])->get();
            $refunds_chart = \App\refund_list::where('state','complete')->whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$i." months")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$i." months")).' 23:59:59'])->get();
            $withdraws_chart = \App\withdraw_list::where('state','complete')->whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$i." months")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$i." months")).' 23:59:59'])->get();
            $login_chart = \App\login_log::whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$i." months")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$i." months")).' 23:59:59'])->groupBy('id_type','login_id')->get()->count();
            $session_chart = \App\login_log::whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$i." months")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$i." months")).' 23:59:59'])->groupBy(DB::raw("date_format(created_at,'%Y-%m-%d')"),'id_type','login_id','ip_address')->get()->count();
          }else {
            $payments_chart = \App\payment_list::where('state','complete')->whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$i." day")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$i." day")).' 23:59:59'])->get();
            $refunds_chart = \App\refund_list::where('state','complete')->whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$i." months")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$i." months")).' 23:59:59'])->get();
            $withdraws_chart = \App\withdraw_list::where('state','complete')->whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$i." months")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$i." months")).' 23:59:59'])->get();
            $login_chart = \App\login_log::whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$i." months")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$i." months")).' 23:59:59'])->groupBy('id_type','login_id')->get()->count();
            $session_chart = \App\login_log::whereBetween('created_at',[date("Y-m-d", strtotime($startDate."-".$i." months")).' 00:00:00',date("Y-m-d", strtotime($endDate."-".$i." months")).' 23:59:59'])->groupBy(DB::raw("date_format(created_at,'%Y-%m-%d')"),'id_type','login_id','ip_address')->get()->count();
          }
          foreach ($payments_chart as $key => $value) {
            $product_chart = \App\product::where('id',$value->product_id)->value('price');
            $payment_money_chart += $product_chart;
          }
          foreach ($refunds_chart as $key => $value) {
            $payment_whithdraw2 = \App\payment_list::where('id',$value->payment_id)->value('product_id');
            $product_chart2 = \App\product::where('id',$payment_whithdraw2)->value('price');
            $refund_money_chart += $product_chart2;
          }
          foreach ($withdraws_chart as $key => $value) {
            $money2 = \App\withdraw_list::where('state','complete')->value('get_money');
            $withdraw_money_chart += $money2;
          }
          $payment_moneys[$i] = $payment_money_chart - $refund_money_chart - $withdraw_money_chart;
          $refund_moneys[$i] = $refund_money_chart;
          $withdraw_moneys[$i] = $withdraw_money_chart;
          $login_count[$i] = $login_chart;
          $session_count[$i] = $session_chart;
          $week_day += 7;
        }
      @endphp

      <!-- 의사 승인대기 건수 -->
      <div class="col-xl-3 col-md-4 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">의사 승인대기</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$doctor}} 건</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-fw fa-user fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 매칭 상담 건수 -->
      <div class="col-xl-3 col-md-4 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">매칭된 상담</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$chat}} 건</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-fw fa-comments fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 일반회원 UV -->
      <div class="col-xl-3 col-md-4 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">회원 UV<br>(순 방문자)</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$login}}</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-fw fa-clipboard-list fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 일반회원 세션 -->
      <div class="col-xl-3 col-md-4 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">회원 세션수<br>(방문자)</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$session}}</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-fw fa-clipboard-list fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 결제 금액 -->
      <div class="col-xl-3 col-md-4 mb-4">
        <div class="card border-left-primary shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total 수익</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{number_format($payment_money - $refund_money - $withdraw_money)}} 원</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 결제 건수  -->
      <div class="col-xl-3 col-md-5 mb-4">
        <div class="card border-left-success shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">결제 건수</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$payment}} 건</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>


      <!-- 환불 신청 건수 -->
      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-info shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-info text-uppercase mb-1">환불 신청 대기</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$refund}} 건</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 출금 신청 건수 -->
      <div class="col-xl-3 col-md-6 mb-4">
        <div class="card border-left-warning shadow h-100 py-2">
          <div class="card-body">
            <div class="row no-gutters align-items-center">
              <div class="col mr-2">
                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">출금 신청 대기</div>
                <div class="h5 mb-0 font-weight-bold text-gray-800">{{$withdraw}} 건</div>
              </div>
              <div class="col-auto">
                <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
    <!-- 통계 건수 금액 Row End-->

    <!-- 차트 Row -->
    <div class="row">
      <!-- Area Chart -->
      <div class="col-xl-8 col-lg-7">
        <div class="card shadow mb-4">
          <!-- Card Header - -->
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">총 수익</h6>
          </div>
          <!-- Card Body -->
          <div class="card-body">
            <div class="chart-area">
              <canvas id="myAreaChart"></canvas>
            </div>
          </div>
        </div>
      </div>

      <!-- Pie Chart -->
      <div class="col-xl-4 col-lg-5">
        <div class="card shadow mb-4">
          <!-- Card Header - Dropdown -->
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">결제 내역</h6>
          </div>
          <!-- Card Body -->
          <div class="card-body">
            <div class="chart-pie pt-4 pb-2" style="text-align: center;">
              @if ($payment != '0' || $refund_complete != '0' || $withdraw_complete != '0')
                <canvas id="myPieChart"></canvas>
              @else
                <span class="mr-2" style="font-weight: bold">
                 데이터가 없습니다.
              </span>
              @endif
            </div>
            <div class="mt-4 text-center small">
              <span class="mr-2">
                <i class="fas fa-circle text-primary"></i> 결제 완료: @php echo $payment; @endphp 건
              </span>
              <span class="mr-2">
                <i class="fas fa-circle text-success"></i> 환불 완료: @php echo $refund_complete; @endphp 건
              </span>
              <span class="mr-2">
                <i class="fas fa-circle text-info"></i> 출금 완료: @php echo $withdraw_complete; @endphp 건
              </span>
            </div>
          </div>
        </div>
      </div>

      <!-- Area Chart -->
      <div class="col-xl-8 col-lg-7">
        <div class="card shadow mb-4">
          <!-- Card Header - -->
          <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            <h6 class="m-0 font-weight-bold text-primary">총 방문자</h6>
          </div>
          <!-- Card Body -->
          <div class="card-body">
            <div class="chart-area">
              <canvas id="myAreaChart2"></canvas>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 차트 Row End-->
  </div>


@endsection

@section('js')
  <script type="text/javascript">
  //일주월 버튼 이벤트
  $(function(){
    $('button[name=day]').click(function(){
      location.href ="/home";
    });
    $('button[name=week]').click(function(){
      location.href ="/home/week";
    });
    $('button[name=month]').click(function(){
      location.href ="/home/month";
    });


    $('button[name=next]').click(function(){
      var date = $('input[name=date]').val();
      var move = $('input[name=move]').val();
      if(!date && !move){
        move++;
        location.href ="/home/day/"+move;
      }else{
        move++;
        location.href ="/home/"+date+"/"+move;
      }
    });
    $('button[name=previous]').click(function(){
      var date = $('input[name=date]').val();
      var move = $('input[name=move]').val();
      if(!date && !move){
        move--;
        location.href ="/home/day/"+move;
      }else{
        move--;
        location.href ="/home/"+date+"/"+move;
      }
    });
  });



  ////////////////////////////선 차트js
  Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
  Chart.defaults.global.defaultFontColor = '#858796';

  function number_format(number, decimals, dec_point, thousands_sep) {
    // *     example: number_format(1234.56, 2, ',', ' ');
    // *     return: '1 234,56'
    number = (number + '').replace(',', '').replace(' ', '');
    var n = !isFinite(+number) ? 0 : +number,
      prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
      sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
      dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
      s = '',
      toFixedFix = function(n, prec) {
        var k = Math.pow(10, prec);
        return '' + Math.round(n * k) / k;
      };
    // Fix for IE parseFloat(0.55).toFixed(0) = 0;
    s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
    if (s[0].length > 3) {
      s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
    }
    if ((s[1] || '').length < prec) {
      s[1] = s[1] || '';
      s[1] += new Array(prec - s[1].length + 1).join('0');
    }
    return s.join(dec);
  }

  // Area Chart Example
  var links = document.location.href.split("/");
  var link;
  var week;
  var money = ["<?= $payment_moneys[6] ?>", "<?= $payment_moneys[5] ?>", "<?= $payment_moneys[4] ?>", "<?= $payment_moneys[3] ?>",
               "<?= $payment_moneys[2] ?>", "<?= $payment_moneys[1] ?>", "<?= $payment_moneys[0] ?>"];
  var login = ["<?= $login_count[6] ?>", "<?= $login_count[5] ?>", "<?= $login_count[4] ?>", "<?= $login_count[3] ?>",
               "<?= $login_count[2] ?>", "<?= $login_count[1] ?>", "<?= $login_count[0] ?>"];
  var session = ["<?= $session_count[6] ?>", "<?= $session_count[5] ?>", "<?= $session_count[4] ?>", "<?= $session_count[3] ?>",
               "<?= $session_count[2] ?>", "<?= $session_count[1] ?>", "<?= $session_count[0] ?>"];
  var gunsu = ['<?= $payment ?>', '<?= $refund_complete ?>', '<?= $withdraw_complete ?>'];
  if(typeof(links[4]) != "undefined" && links[4] !== null)
  {
    link = links[4];
  }
  else
  {
    link = links[3];
  }

  if(link == 'home')
  {
    week = ["<?= $yoil[date('w', strtotime($curDate."-6 days"))] ?>", "<?= $yoil[date('w', strtotime($curDate."-5 days"))] ?>", "<?= $yoil[date('w', strtotime($curDate."-4 days"))] ?>", "<?= $yoil[date('w', strtotime($curDate."-3 days"))] ?>",
            "<?= $yoil[date('w', strtotime($curDate."-2 days"))] ?>", "<?= $yoil[date('w', strtotime($curDate."-1 days"))] ?>", "<?= $yoil[date('w', strtotime($curDate))] ?>"];

  }
  else if(link == 'day')
  {
    week = ["<?= $yoil[date('w', strtotime($curDate."-6 days"))] ?>", "<?= $yoil[date('w', strtotime($curDate."-5 days"))] ?>", "<?= $yoil[date('w', strtotime($curDate."-4 days"))] ?>", "<?= $yoil[date('w', strtotime($curDate."-3 days"))] ?>",
            "<?= $yoil[date('w', strtotime($curDate."-2 days"))] ?>", "<?= $yoil[date('w', strtotime($curDate."-1 days"))] ?>", "<?= $yoil[date('w', strtotime($curDate))] ?>"];

  }
  else if(link == 'week')
  {
    week = ["6주전", "5주전", "4주전", "3주전", "2주전", "1주전", "이번주"];

  }
  else if(link == 'month')
  {
    week = ["<?= date("m", strtotime($curDate."-6 months"))."월" ?>", "<?= date("m", strtotime($curDate."-5 months"))."월" ?>", "<?= date("m", strtotime($curDate."-4 months"))."월" ?>", "<?= date("m", strtotime($curDate."-3 months"))."월" ?>",
            "<?= date("m", strtotime($curDate."-2 months"))."월" ?>", "<?= date("m", strtotime($curDate."-1 months"))."월" ?>", "<?= date("m", strtotime($curDate))."월" ?>"];

  }




  var ctx = document.getElementById("myAreaChart");
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: week,
      datasets: [{
        label: "수익",
        lineTension: 0.3,
        backgroundColor: "rgba(78, 115, 223, 0.05)",
        borderColor: "rgba(78, 115, 223, 1)",
        pointRadius: 3,
        pointBackgroundColor: "rgba(78, 115, 223, 1)",
        pointBorderColor: "rgba(78, 115, 223, 1)",
        pointHoverRadius: 3,
        pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
        pointHoverBorderColor: "rgba(78, 115, 223, 1)",
        pointHitRadius: 10,
        pointBorderWidth: 2,
        data: money
      }],
    },
    options: {
      maintainAspectRatio: false,
      layout: {
        padding: {
          left: 10,
          right: 25,
          top: 25,
          bottom: 0
        }
      },
      scales: {
        xAxes: [{
          time: {
            unit: 'date'
          },
          gridLines: {
            display: false,
            drawBorder: false
          },
          ticks: {
            maxTicksLimit: 7
          }
        }],
        yAxes: [{
          ticks: {
            maxTicksLimit: 5,
            padding: 10,
            // Include a dollar sign in the ticks
            callback: function(value, index, values) {
              return number_format(value) + ' 원';
            }
          },
          gridLines: {
            color: "rgb(234, 236, 244)",
            zeroLineColor: "rgb(234, 236, 244)",
            drawBorder: false,
            borderDash: [2],
            zeroLineBorderDash: [2]
          }
        }],
      },
      legend: {
        display: false
      },
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        titleMarginBottom: 10,
        titleFontColor: '#6e707e',
        titleFontSize: 14,
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        intersect: false,
        mode: 'index',
        caretPadding: 10,
        callbacks: {
          label: function(tooltipItem, chart) {
            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
            return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' 원';
          }
        }
      }
    }
  });



  var ctx = document.getElementById("myAreaChart2");
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: week,
      datasets: [
        {
        label: "UV",
        lineTension: 0.3,
        backgroundColor: "rgba(101, 226, 165, 0.05)",
        borderColor: "rgba(101, 226, 165, 1)",
        pointRadius: 3,
        pointBackgroundColor: "rgba(101, 226, 165, 1)",
        pointBorderColor: "rgba(101, 226, 165, 1)",
        pointHoverRadius: 3,
        pointHoverBackgroundColor: "rgba(101, 226, 165, 1)",
        pointHoverBorderColor: "rgba(101, 226, 165, 1)",
        pointHitRadius: 10,
        pointBorderWidth: 2,
        data: login
      },
      {
      label: "세션",
      lineTension: 0.3,
      backgroundColor: "rgba(101, 226, 230, 0.05)",
      borderColor: "rgba(101, 226, 230, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(101, 226, 230, 1)",
      pointBorderColor: "rgba(101, 226, 230, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(101, 226, 230, 1)",
      pointHoverBorderColor: "rgba(101, 226, 230, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: session
    }
    ],
    },
    options: {
      maintainAspectRatio: false,
      layout: {
        padding: {
          left: 10,
          right: 25,
          top: 25,
          bottom: 0
        }
      },
      scales: {
        xAxes: [{
          time: {
            unit: 'date'
          },
          gridLines: {
            display: false,
            drawBorder: false
          },
          ticks: {
            maxTicksLimit: 7
          }
        }],
        yAxes: [{
          ticks: {
            maxTicksLimit: 5,
            padding: 10,
            // Include a dollar sign in the ticks
            callback: function(value, index, values) {
              return number_format(value) + ' 명';
            }
          },
          gridLines: {
            color: "rgb(234, 236, 244)",
            zeroLineColor: "rgb(234, 236, 244)",
            drawBorder: false,
            borderDash: [2],
            zeroLineBorderDash: [2]
          }
        }],
      },
      legend: {
        display: false
      },
      tooltips: {
        backgroundColor: "rgb(255,255,255)",
        bodyFontColor: "#858796",
        titleMarginBottom: 10,
        titleFontColor: '#6e707e',
        titleFontSize: 14,
        borderColor: '#dddfeb',
        borderWidth: 1,
        xPadding: 15,
        yPadding: 15,
        displayColors: false,
        intersect: false,
        mode: 'index',
        caretPadding: 10,
        callbacks: {
          label: function(tooltipItem, chart) {
            var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
            return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' 명';
          }
        }
      }
    }
  });


//////////////////////////////////////////파이 차트 js
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["결제 완료", "환불 완료", "출금 완료"],
    datasets: [{
      data: gunsu,
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
  </script>
@endsection

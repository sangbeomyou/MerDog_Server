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
    <h1 class="h3 mb-2 text-gray-800">상품 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 상품 내역 >> 상품 상세</p>


    <!-- DataTales Example -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">[{{ $product->id }}번] 상품 상세</h6>
      </div>
      <!-- Contents -->
      <div class="card-body">
        <div class="table-responsive">
          <h4>상품 정보</h4>
            @php
              $count = \App\payment_list::where([['product_id', $product->id],['state','complete']])->count();
            @endphp
          <table class="table table-bordered" id="th" style="text-align:left; width: 50%; font-size: small;" cellspacing="0" border-spacing="5px">
            <tbody>
              <tr>
                <th width=25%>상품 번호</th>
                <td>{{ $product->id }}</td>
              </tr>
              <tr>
                <th>상품 이미지</th>
                <td style="text-align:center">
                  <img style="max-width:70%;" src="{{ asset('storage/img/product/'.$product->img) }}">
                </td>
              </tr>
              <tr>
                <th>상품 이름</th>
                <td>{{ $product->name }}</td>
              </tr>
              <tr>
                <th>상품ID (구글)</th>
                <td>{{ $product->product_code }}</td>
              </tr>
              <tr>
                <th>지급 이용권</th>
                <td>{{ $product->ticket }} 개</td>
              </tr>
              <tr>
                <th>상품 가격</th>
                <td>&#8361; {{ number_format($product->price) }}</td>
              </tr>
              <tr>
                <th>총 구매 횟수</th>
                <td>{{ $count }}회</td>
              </tr>
            </tbody>
          </table>
          <div class="btn section" style="float: right;padding-right: 0px;border-right-width: 0px;">
            {{-- 상품수정 --}}
            <a href="{{ route("manage.product_manage.product_update", ["id" => $product->id]) }}" class="btn btn-primary btn-icon-split">
              <span class="text">상품수정</span>
            </a>
            {{-- 돌아가기 --}}
            <a href="{{ route("manage.product_manage.product") }}" class="btn btn-secondary btn-icon-split">
              <span class="text"><i class="fas fa-arrow-left">&nbsp</i>돌아가기</span>
            </a>
          </div>
        </div>
      </div>
    </div>
@endsection

@section('js')
  <script type="text/javascript">
    function registerID(){
      var stop = confirm("해당 상품을 등록 하시겠습니까?");
      if(!stop){
        return false;
      }else{
        alert("해당 상품이 등록되었습니다.");
      }
    }
  </script>
@endsection

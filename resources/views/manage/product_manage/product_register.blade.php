@extends('layouts.layout_main')

@section('css')
  <style media="screen">
  #th th { background-color:#eeeeee; padding:10px; border:1px solid #cdcfd6; text-align:center;}
  table {border-spacing: 1022px};


  /* 업로드버튼 */
  .filebox.preview-image label {
    color: #fff;
    background-color: #337ab7;
  	border-color: #2e6da4;
    }
  /* 라벨 */
  .filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #fff;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #337ab7;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #2e6da4;
    border-color: #2e6da4;
    border-radius: .25em;
    }
  /* named upload */
  .filebox .upload-name {
    display: inline-block;
    padding: 3% .20%;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    }
  /* imaged preview */
  .filebox .upload-display { /* 이미지가 표시될 지역 */
    margin-bottom: 5px;
    }
    @media(min-width: 768px) {
      .filebox .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
        }
    }
  .filebox .upload-thumb-wrap { /* 추가될 이미지를 감싸는 요소 */
    display: inline-block;
    width: 200px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
    }
  .filebox .upload-display img { /* 추가될 이미지 */
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
   }
  </style>
@endsection

@section('content')
  <div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">상품 관리</h1>
    <p class="mb-4 small">&nbsp&nbsp&nbsp >> 상품 관리 >> 상품 등록</p>

    <!-- 수정창 -->
    <div class="card shadow mb-4">
      <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">상품 등록</h6>
      </div>
      <div class="card-body mb-3">
        <form action={{ route("manage.product_manage.product_register_success") }} method="post" enctype="multipart/form-data" onsubmit="return registerID();">
          @csrf
          <div class="input-group row mb-3" style="width:50%;">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">상품 이름</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <input type="text" class="form-control" name="name" value="{{old('name')}}" required>
              {!! $errors->first('name', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="input-group row mb-3" style="width:50%;">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">지급 이용권 갯수</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <input type="number" class="form-control" name="ticket" value="{{old('ticket')}}" required>
              {!! $errors->first('ticket', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="input-group row mb-3" style="width:50%;">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">상품 가격</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <input type="number" min="0" class="form-control" name="price" value="{{old('price')}}" required>
              {!! $errors->first('price', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="input-group row mb-3" style="width:50%;">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">상품 코드</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <input type="text" min="0" class="form-control" name="code" value="{{old('code')}}" required>
              {!! $errors->first('code', '<span class="form-error">:message</span>') !!}
              <div id="guide_confirm" class="h6 small" style="color: red; padding-top: 5px;">※구글 콘솔에서 상품 ID를 입력해주세요.</div>
              {{-- <input type="hidden" name="guide_confirm" value="0"> --}}
            </div>
          </div>
          <div class="input-group row mb-3" style="width:50%;">
            <label for="basic-url" class="col-12 col-sm-3 col-form-label text-sm-right">상품 이미지</label>
            <div class="col-12 col-sm-8 col-lg-6">
              <div class="filebox preview-image">
                <input class="upload-name" value="파일을 선택해주세요." value="{{old('img')}}" disabled="disabled">
                <label for="input-file" style="margin-bottom: 0px;">업로드</label>
                <div id="input_img" style="margin-top: 5px;"></div>
                <input type="file" id="input-file" class="upload-hidden" name="img" value="{{old('img')}}" style="display:none">
              </div>
              {!! $errors->first('img', '<span class="form-error">:message</span>') !!}
            </div>
          </div>
          <div class="btn section" style="float: right;padding-right: 0px;border-right-width: 0px;">
            {{-- 등록 --}}
            <button type="submit" class="btn btn-primary">상품 등록</button>
          </div>
        </form>
      </div>
    </div>
  </div>
@endsection

@section('js')
  <script type="text/javascript">
    function registerID(){
      if($("input[name=img]").val() == ""){
        alert("이미지를 등록해주세요.");
        return false;
      }
      var stop = confirm("해당 상품을 등록 하시겠습니까?");
      if(!stop){
        return false;
      }
    }

    //라벨에 파일명 띄우기
    $(document).ready(function(){
      var fileTarget = $('.filebox .upload-hidden');
      fileTarget.on('change', function(){
        if(window.FileReader){
          var filename = $(this)[0].files[0].name;
        }
        else{
          var filename = $(this).val().split('/').pop().split('\\').pop();
        }
         //추출한 파일명 삽입
         $(this).siblings('.upload-name').val(filename);
       });
     });

    //이미지 미리보기
    var imgTarget = $('.preview-image .upload-hidden');

    imgTarget.on('change', function(){

      if(window.FileReader){
        // if (!$(this)[0].files[0].type.match(/image\//)) return;

        var reader = new FileReader();
        reader.onload = function(e){
          var src = e.target.result;
          $("#input_img").empty();
          $("#input_img").append('<div onclick="delete_img();" class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
          // parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
        }
        reader.readAsDataURL($(this)[0].files[0]);
      }
    });

    function delete_img(){
      $("#input_img").empty();
      $("input[name=img]").val("");
      $(".upload-name").val("파일을 선택해주세요.");
    }

  </script>
@endsection

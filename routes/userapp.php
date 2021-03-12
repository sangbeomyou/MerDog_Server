
<?php
// 유저앱 url 라우팅

// /*테스트용 */
// Route::post('userapp/test',[
//   'uses' => 'UserAppController@test'
// ]);
/*테스트용 */


/*사용자 등록*/
Route::post('userapp/register',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@register'
]);

/*사용자 로그인*/
Route::post('userapp/login',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@login'
]);

/*사용자 토큰 검증*/
Route::post('userapp/check_token',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@check_token'
]);

/*사용자 로그아웃*/
Route::post('userapp/logout',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@logout'
]);

/*사용자 fcm토큰 재설정*/
Route::post('userapp/fcm_token',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@fcm_token'
]);

/*사용자 전화번호 중복확인*/
Route::post('userapp/check_phone',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@check_phone'
]);

/*사용자 아이디 중복확인*/
Route::post('userapp/check_id',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@check_id'
]);

/*사용자 닉네임 중복확인*/
Route::post('userapp/check_nick',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@check_nick'
]);

/*사용자 이용권 갯수*/
Route::post('userapp/ticket',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@ticket'
]);

/*사용자 마이페이지*/
Route::post('userapp/mypage',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@mypage'
]);

/*사용자 마이페이지 수정*/
Route::post('userapp/mypage_update',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@mypage_update'
]);

/*사용자 반려동물 목록*/
Route::post('userapp/pet_list',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@pet_list'
]);

/*사용자 반려동물 등록*/
Route::post('userapp/pet_register',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@pet_register'
]);

/*사용자 반려동물 상세*/
Route::post('userapp/pet_detail',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@pet_detail'
]);

/*사용자 반려동물 수정*/
Route::post('userapp/pet_update',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@pet_update'
]);

/*사용자 반려동물 삭제*/
Route::post('userapp/pet_destroy',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@pet_destroy'
]);

/*비밀번호 찾기*/
Route::post('userapp/find_pw',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@find_pw'
]);

/*아이디 찾기*/
Route::post('userapp/find_id',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@find_id'
]);

/*상품 목록 불러오기*/
Route::post('userapp/product',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@product'
]);

/*결제신청*/
Route::post('userapp/payment',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@payment'
]);

/*결제 내역 목록*/
Route::post('userapp/payment_list',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@payment_list'
]);

/*결제 내역 상세*/
Route::post('userapp/payment_load',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@payment_load'
]);

/*환불 신청*/
Route::post('userapp/refund',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@refund'
]);

/*환불 신청 내역 목록*/
Route::post('userapp/refund_list',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@refund_list'
]);

/*환불 신청 상세*/
Route::post('userapp/refund_load',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@refund_load'
]);

/*환불 신청 수정*/
Route::post('userapp/refund_update',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@refund_update'
]);

/*환불 신청 삭제*/
Route::post('userapp/refund_destroy',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@refund_destroy'
]);


/*평점 등록*/
Route::post('userapp/rating',[
  // 'as' => 'userapp.register',
  'uses' => 'UserAppController@rating'
]);
?>

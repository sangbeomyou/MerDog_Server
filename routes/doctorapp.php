
<?php
// 의사앱 url 라우팅

/*테스트용 */
Route::post('doctorapp/test',[
  // 'as' => 'doctorapp.register',
  'uses' => 'DoctorAppController@Upload'
]);

/*의사 등록*/
Route::post('doctorapp/register',[
  // 'as' => 'doctorapp.register',
  'uses' => 'DoctorAppController@register'
]);

/*거부 상태 자격증 정보 변경*/
Route::post('doctorapp/re_register',[
  // 'as' => 'doctorapp.register',
  'uses' => 'DoctorAppController@re_register'
]);

/*의사 로그인*/
Route::post('doctorapp/login',[
  // 'as' => 'doctorapp.register',
  'uses' => 'DoctorAppController@login'
]);

/*의사 토큰 검증*/
Route::post('doctorapp/check_token',[
  // 'as' => 'doctorapp.register',
  'uses' => 'DoctorAppController@check_token'
]);

/*의사 로그아웃*/
Route::post('doctorapp/logout',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@logout'
]);

/*의사 fcm토큰 재설정*/
Route::post('doctorapp/fcm_token',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@fcm_token'
]);

/*의사 채팅상태 등록*/
Route::post('doctorapp/state',[
  // 'as' => 'doctorapp.register',
  'uses' => 'DoctorAppController@state'
]);

/*의사 현재 위치 등록*/
Route::post('doctorapp/location',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@location'
]);

/*의사 전화번호 중복확인*/
Route::post('doctorapp/check_phone',[
  // 'as' => 'doctorapp.register',
  'uses' => 'DoctorAppController@check_phone'
]);

/*의사 아이디 중복확인*/
Route::post('doctorapp/check_id',[
  // 'as' => 'doctorapp.register',
  'uses' => 'DoctorAppController@check_id'
]);

/*아이디 찾기*/
Route::post('doctorapp/find_id',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@find_id'
]);

/*비밀번호 찾기*/
Route::post('doctorapp/find_pw',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@find_pw'
]);

/*마이페이지*/
Route::post('doctorapp/mypage',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@mypage'
]);

/*내 정보 불러오기 <수정 시>*/
Route::post('doctorapp/mypage_load',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@mypage_load'
]);

/*마이페이지 수정*/
Route::post('doctorapp/mypage_update',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@mypage_update'
]);

/*병원 등록*/
Route::post('doctorapp/hospital_register',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@hospital_register'
]);

/*병원정보 불러오기*/
Route::post('doctorapp/hospital_load',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@hospital_load'
]);

/*병원 수정*/
Route::post('doctorapp/hospital_update',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@hospital_update'
]);

/*계좌정보 목록*/
Route::post('doctorapp/account_load',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@account_load'
]);

/*계좌정보 등록*/
Route::post('doctorapp/account_register',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@account_register'
]);

/*계좌정보 수정*/
Route::post('doctorapp/account_update',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@account_update'
]);

/*출금신청 완료 내역*/
Route::post('doctorapp/withdraw_list',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@withdraw_list'
]);

/*출금신청 대기 내역*/
Route::post('doctorapp/withdraw_request_list',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@withdraw_request_list'
]);

/*출금신청 등록*/
Route::post('doctorapp/withdraw_register',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@withdraw_register'
]);

/*출금신청 수정*/
Route::post('doctorapp/withdraw_update',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@withdraw_update'
]);

/*출금신청 삭제*/
Route::post('doctorapp/withdraw_destroy',[
  // 'as' => 'userapp.register',
  'uses' => 'DoctorAppController@withdraw_destroy'
]);
?>

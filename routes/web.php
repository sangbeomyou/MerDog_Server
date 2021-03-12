<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
include "test.php";

// /*테스트용 */
// Route::get('/te', function () {
//     return view('register');
// });
// //로그인

include "ajax.php";
include "userapp.php";
include "doctorapp.php";
include "chat.php";
include "policy.php";

// 메인
/*로그인시 HOME 화면 */
Route::get('/home/{date?}/{move?}', function ($date = null, $move = null) {
    return view('main.home')->with('date',$date)->with('move',$move);
})->middleware('auth')->name('home');


/*로그인 창*/
Route::get('/',[
  'as' => 'login',
  'uses' => 'LoginController@create'
]);
/*로그인 처리*/
Route::post('/',[
  'as' => 'login.store',
  'uses' => 'LoginController@store'
]);
/*로그아웃 처리*/
Route::get('/logout',[
  'as' => 'logout',
  'uses' => 'LoginController@destroy'
]);


//사용자 등록

/*회원가입 창*/
Route::get('/register',[
  'as' => 'register',
  'uses' => 'RegisterController@create'
]);
/*회원가입 처리*/
Route::post('/register',[
  'as' => 'register.store',
  'uses' => 'RegisterController@store'
]);

//회원관리
/*관리자*/
Route::get('/manage/admin',[
  'as' => 'manage.admin',
  'uses' => 'ManageController@admin_create'
]);
/*관리자 비밀번호 재설정*/
Route::post('/manage/admin/pw',[
  'as' => 'manage.admin_pw',
  'uses' => 'ManageController@admin_pw'
]);
/*관리자 직급 변경*/
Route::post('/manage/admin/level',[
  'as' => 'manage.admin_level',
  'uses' => 'ManageController@admin_level'
]);

/*의사*/
Route::get('/manage/doctor',[
  'as' => 'manage.doctor',
  'uses' => 'ManageController@doctor_create'
]);
/*의사 전체 수수료 조정*/
Route::post('/manage/doctor/fee',[
  'as' => 'manage.doctor_fee',
  'uses' => 'ManageController@doctor_fee'
]);
/*의사 -> 의사 일시정지회원 페이지*/
Route::get('/manage/doctor/stop_doctor',[
  'as' => 'manage.stop_doctor',
  'uses' => 'ManageController@stop_doctor'
]);
/*의사 상세*/
Route::get('/manage/doctor/detail/{id?}',[
  'as' => 'manage.doctor_detail',
  'uses' => 'ManageController@doctor_detail'
]);
/*의사 상세 -> FCM 발송 */
Route::post('/manage/doctor/detail_fcm',[
  'as' => 'manage.doctor_detail_fcm',
  'uses' => 'ManageController@doctor_detail_fcm'
]);
/*의사 상세 수수료 조정*/
Route::post('/manage/doctor/detail_fee',[
  'as' => 'manage.doctor_detail_fee',
  'uses' => 'ManageController@doctor_detail_fee'
]);
/*의사 상세 -> 회원 일시정지*/
Route::post('/manage/doctor/doctor_stop',[
  'as' => 'manage.doctor_stop',
  'uses' => 'ManageController@doctor_stop'
]);

/*회원*/
Route::get('/manage/user',[
  'as' => 'manage.user',
  'uses' => 'ManageController@user_create'
]);
/*회원 이용권 지급*/
Route::post('/manage/user/ticket',[
  'as' => 'manage.user_ticket',
  'uses' => 'ManageController@user_ticket'
]);
/*회원 -> 일시정지회원 페이지*/
Route::get('/manage/user/stop_user',[
  'as' => 'manage.stop_user',
  'uses' => 'ManageController@stop_user'
]);
/*회원 상세*/
Route::get('/manage/user/detail/{id?}',[
  'as' => 'manage.user_detail',
  'uses' => 'ManageController@user_detail'
]);
/*회원 상세 -> FCM 발송 */
Route::post('/manage/user/detail_fcm',[
  'as' => 'manage.user_detail_fcm',
  'uses' => 'ManageController@user_detail_fcm'
]);
/*회원 상세 -> 회원 이용권 지급*/
Route::post('/manage/user/detail_ticket',[
  'as' => 'manage.user_detail_ticket',
  'uses' => 'ManageController@user_detail_ticket'
]);
/*회원 상세 -> 회원 일시정지*/
Route::post('/manage/user/user_stop',[
  'as' => 'manage.user_stop',
  'uses' => 'ManageController@user_stop'
]);


//승인 대기
/*승인대기 - 관리자 목록*/
Route::get('/manage/wait_admin',[
  'as' => 'manage.wait_admin',
  'uses' => 'ManageController@wait_admin_create'
]);
/*승인대기 - 관리자 승인*/
Route::post('/manage/wait_admin/update',[
  'as' => 'manage.wait_admin.update',
  'uses' => 'ManageController@wait_admin_update'
]);
/*승인대기 - 관리자 승인거부*/
Route::post('/manage/wait_admin/delete',[
  'as' => 'manage.wait_admin.delete',
  'uses' => 'ManageController@wait_admin_delete'
]);

/*승인대기 - 의사 회원 목록*/
Route::get('/manage/wait_doctor',[
  'as' => 'manage.wait_doctor',
  'uses' => 'ManageController@wait_doctor_create'
]);
/*승인대기 - 의사 승인*/
Route::post('/manage/wait_doctor/update',[
  'as' => 'manage.wait_doctor.update',
  'uses' => 'ManageController@wait_doctor_update'
]);
/*승인대기 - 의사 승인거부*/
Route::post('/manage/wait_doctor/delete',[
  'as' => 'manage.wait_doctor.delete',
  'uses' => 'ManageController@wait_doctor_delete'
]);

//상담관리
/*상담 관리 목록*/
 Route::get('/manage/chat/{id?}',[
   'as' => 'manage.chat',
   'uses' => 'ManageController@chat'
 ]);
/*상담 상세 내역*/
 Route::get('/manage/chat/detail/{id?}',[
   'as' => 'manage.chat_detail',
   'uses' => 'ManageController@chat_detail'
]);
/*채팅방 상담 상세 내역*/
Route::get('/manage/chat/detail/room/{id?}',[
  'as' => 'manage.chat_manage.room_chat_detail',
  'uses' => 'ManageController@room_chat_detail'
]);
/* 일반회원 채팅목록(회원별 상담) */
Route::get('/manage/user_chat',[
  'as' => 'manage.user_chat',
  'uses' => 'ManageController@user_chat'
]);
/* 일반회원 채팅상세 전체내역(회원별 상담) */
Route::get('/manage/user_chat/detail/{id?}',[
  'as' => 'manage.user_chat_detail',
  'uses' => 'ManageController@user_chat_detail'
]);
/* 의사회원 채팅목록(회원별 상담) */
Route::get('/manage/doctor_chat',[
  'as' => 'manage.doctor_chat',
  'uses' => 'ManageController@doctor_chat'
]);
/* 의사회원 채팅상세 전체내역(회원별 상담) */
Route::get('/manage/doctor_chat/detail/{id?}',[
  'as' => 'manage.doctor_chat_detail',
  'uses' => 'ManageController@doctor_chat_detail'
]);

//결제관리

/*결제 내역*/
Route::get('/manage/payment/{id?}',[
  'as' => 'manage.payment_manage.payment',
  'uses' => 'ManageController@payment'
]);

/*무통장 신청 내역*/
Route::get('/manage/passbook',[
  'as' => 'manage.payment_manage.passbook',
  'uses' => 'ManageController@passbook'
]);
/*무통장 신청 승인*/
Route::post('/manage/passbook/update',[
  'as' => 'manage.payment_manage.passbook_update',
  'uses' => 'ManageController@passbook_update'
]);
/*무통장 신청 거절*/
Route::post('/manage/passbook/delete',[
  'as' => 'manage.payment_manage.passbook_delete',
  'uses' => 'ManageController@passbook_delete'
]);

/*환불 신청 내역*/
Route::get('/manage/refund',[
  'as' => 'manage.payment_manage.refund',
  'uses' => 'ManageController@refund'
]);
/*환불 신청 승인*/
Route::post('/manage/refund/update',[
  'as' => 'manage.payment_manage.refund_update',
  'uses' => 'ManageController@refund_update'
]);
/*환불 신청 거절*/
Route::post('/manage/refund/delete',[
  'as' => 'manage.payment_manage.refund_delete',
  'uses' => 'ManageController@refund_delete'
]);

/*출금 내역*/
Route::get('/manage/withdraw/{id?}',[
  'as' => 'manage.payment_manage.withdraw',
  'uses' => 'ManageController@withdraw'
]);
/*출금 신청 내역*/
Route::get('/manage/withdraw_request',[
  'as' => 'manage.payment_manage.withdraw_request',
  'uses' => 'ManageController@withdraw_request'
]);

/*출금 신청 수락*/
Route::post('/manage/withdraw_request/accept',[
  'as' => 'manage.payment_manage.withdraw_request.accept',
  'uses' => 'ManageController@withdraw_request_accept'
]);

/*출금 신청 거절*/
Route::post('/manage/withdraw_request/deny',[
  'as' => 'manage.payment_manage.withdraw_request.deny',
  'uses' => 'ManageController@withdraw_request_deny'
]);

//상품관리

/*상품 내역*/
Route::get('/manage/product',[
  'as' => 'manage.product_manage.product',
  'uses' => 'ManageController@product'
]);

/*상품 상세*/
Route::get('/manage/product/detail/{id?}',[
  'as' => 'manage.product_manage.product_detail',
  'uses' => 'ManageController@product_detail'
]);

/*상품 수정 페이지*/
Route::get('/manage/product/update/{id?}',[
  'as' => 'manage.product_manage.product_update',
  'uses' => 'ManageController@product_update'
]);

/*상품 수정 완료*/
Route::post('/manage/product/update/{id?}',[
  'as' => 'manage.product_manage.product_update_success',
  'uses' => 'ManageController@product_update_success'
]);

/*상품 상태 변경*/
Route::post('/manage/product/state/{id?}',[
  'as' => 'manage.product_manage.product_state',
  'uses' => 'ManageController@product_state'
]);

/*상품 등록 페이지*/
Route::get('/manage/product/register',[
  'as' => 'manage.product_manage.product_register',
  'uses' => 'ManageController@product_register'
]);

/*상품 등록*/
Route::post('/manage/product/register',[
  'as' => 'manage.product_manage.product_register_success',
  'uses' => 'ManageController@product_register_success'
]);



//로그 관리

/*로그인 로그 내역*/
Route::get('/log/login/{id?}',[
  'as' => 'log.login_log',
  'uses' => 'LogController@login_log'
]);

/*FCM 로그 내역*/
Route::get('/log/fcm/{id?}',[
  'as' => 'log.fcm_log',
  'uses' => 'LogController@fcm_log'
]);

/*SMS 로그 내역*/
Route::get('/log/sms',[
  'as' => 'log.sms_log',
  'uses' => 'LogController@sms_log'
]);





//설정

/*FCM 발송 페이지*/
Route::get('/config/fcm',[
  'as' => 'config.fcm',
  'uses' => 'ConfigController@fcm'
]);

/*FCM 발송*/
Route::POST('/config/fcm',[
  'as' => 'config.fcm_send',
  'uses' => 'ConfigController@fcm_send'
]);

// /*무통장 입금 계좌 설정*/
// Route::get('/config/passbook',[
//   'as' => 'config.passbook_config',
//   'uses' => 'ConfigController@passbook'
// ]);
//
// /*무통장 입금 계좌 등록 완료*/
// Route::post('/manage/passbook/register',[
//   'as' => 'config.passbook_register_success',
//   'uses' => 'ConfigController@passbook_register_success'
// ]);
//
// /*무통장 입금 계좌 등록 변경*/
// Route::post('/config/passbook/update',[
//   'as' => 'config.passbook_config.update',
//   'uses' => 'ConfigController@passbook_update'
// ]);
//
// /*통장 입금 계좌 삭제*/
// Route::post('/config/passbook/delete/',[
//   'as' => 'config.passbook_config.delete',
//   'uses' => 'ConfigController@passbook_delete'
// ]);

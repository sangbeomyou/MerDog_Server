<?php

/*채팅 관련*/
// 일반 사용자가 의사에게 채팅 요청 및 상태확인
Route::post('chat/request',[
  // 'as' => 'doctorapp.register',
  'uses' => 'ChatController@request'
]);
// 일반 사용자가 의사에게 채팅 요청 취소
Route::post('chat/cancel',[
  // 'as' => 'doctorapp.register',
  'uses' => 'ChatController@cancel'
]);
// 의사가 채팅 푸시알림으로 인해 채팅 요청 확인
Route::post('chat/response',[
  // 'as' => 'doctorapp.register',
  'uses' => 'ChatController@response'
]);
// 의사가 채팅 수락
Route::post('chat/accept',[
  // 'as' => 'doctorapp.register',
  'uses' => 'ChatController@accept'
]);
// 채팅방 들어갈때 채팅 불러오기 (유저/의사)
Route::post('chat/load',[
  // 'as' => 'doctorapp.register',
  'uses' => 'ChatController@load'
]);
// 채팅방 목록 불러오기 (유저/의사)
Route::post('chat/list',[
  // 'as' => 'doctorapp.register',
  'uses' => 'ChatController@list'
]);
// 채팅 보내기
Route::post('chat/send',[
  // 'as' => 'doctorapp.register',
  'uses' => 'ChatController@send'
]);
// 채팅 추가시간 주기
Route::post('chat/add_time',[
  // 'as' => 'doctorapp.register',
  'uses' => 'ChatController@add_time'
]);
?>

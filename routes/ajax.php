<?php

/* AJAX */
/*아이디 중복확인*/
Route::post('ajax/check_id',[
  'as' => 'ajax.check_id',
  'uses' => 'AjaxController@check_id'
]);
/*SMS 전송*/
Route::post('ajax/sms',[
  'as' => 'ajax.sms',
  'uses' => 'AjaxController@sendSMS'
]);
?>

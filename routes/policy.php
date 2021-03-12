<?php

/* 이용약관 페이지 */
/*서비스 이용약관*/
Route::get('policy/service', function () {
    return view('policy.service');
});
/*개인정보 이용약관*/
Route::get('policy/privacy', function () {
    return view('policy.privacy');
});
//로그인
?>

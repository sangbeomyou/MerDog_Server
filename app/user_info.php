<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class user_info extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "user_info";

  //대용량할당
  protected $fillable = ['user_id', 'user_pw', 'user_phone', 'user_nick', 'created_at', 'user_kakao', 'user_naver', 'fcm_token', 'doctor_token','ticket'];

  //조회시 제외할 칼럼
  protected $hidden = ['user_pw', 'remember_token'];

  /*자동 타입변환*/
  // protected $casts = [
  //     'email_verified_at' => 'datetime',
  // ];
}

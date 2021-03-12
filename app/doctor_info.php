<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class doctor_info extends model
{

  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "doctor_info";

  //대용량할당
  protected $fillable = ['doctor_id', 'doctor_pw', 'doctor_phone', 'doctor_name',
  'doctor_kakao', 'doctor_naver', 'doctor_google', 'doctor_facebook', 'doctor_twitter', 'doctor_token', 'latitude', 'longitude', 'address',
  'on/off', 'fcm_token', 'fee', 'created_at'
];

  //조회시 제외할 칼럼
  protected $hidden = ['doctor_pw'];

  public function license()
  {
    return $this->hasMany(license::class);
  }


  /*자동 타입변환*/
  // protected $casts = [
  //     'email_verified_at' => 'datetime',
  // ];
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class chat extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "chat";

  //대용량할당
  protected $fillable = ['request_id', 'id_type', 'send_user', 'send_doctor', 'room', 'message_type', 'message', 'read'];

  //조회시 제외할 칼럼
  // protected $hidden = ['doctor_pw', 'remember_token'];

  // public function license()
  // {
  //   return $this->hasMany(license::class);
  // }

  /*자동 타입변환*/
  // protected $casts = [
  //     'email_verified_at' => 'datetime',
  // ];
}

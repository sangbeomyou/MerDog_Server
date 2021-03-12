<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class license extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "license";

  //대용량할당
  protected $fillable = ['img_name','doctor_id','division'];

  public function doctor_info()
  {
    return $this->belongsTo(doctor_info::class);
  }

  /*자동 타입변환*/
  // protected $casts = [
  //     'email_verified_at' => 'datetime',
  // ];
}

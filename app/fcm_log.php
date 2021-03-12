<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class fcm_log extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "fcm_log";

  //대용량할당
  protected $fillable = ['id_type', 'fcm_id', 'type', 'ip_address'];

}

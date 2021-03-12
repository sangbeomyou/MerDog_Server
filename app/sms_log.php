<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class sms_log extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "sms_log";

  //대용량할당
  protected $fillable = ['phone','type','ip_address'];

}

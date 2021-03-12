<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class accumulate extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "accumulate";

  //대용량할당
  protected $fillable = ['doctor_id','point','chat_request_id'];
}

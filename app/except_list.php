<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class except_list extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "except_list";

  //대용량할당
  protected $fillable = ['chat_request_id', 'except'];
}

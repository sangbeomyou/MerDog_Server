<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class login_log extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "login_log";

  //대용량할당
  protected $fillable = ['id_type','login_id','ip_address'];

}

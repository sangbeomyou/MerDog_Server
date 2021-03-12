<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class withdraw_list extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "withdraw_list";

  //대용량할당
  protected $fillable = ['doctor_id','price', 'fee','state','get_money','coment'];
}

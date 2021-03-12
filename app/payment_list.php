<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class payment_list extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "payment_list";

  //대용량할당
  protected $fillable = ['user_id','product_id','state'];
}

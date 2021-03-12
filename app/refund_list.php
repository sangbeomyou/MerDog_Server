<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class refund_list extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "refund_list";

  //대용량할당
  protected $fillable = ['user_id','payment_list_id', 'order_id', 'coment','state'];
}

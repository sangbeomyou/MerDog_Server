<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class account extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "account";

  //대용량할당
  protected $fillable = ['doctor_id','bank_name', 'bank_number', 'bank_depo'];
}

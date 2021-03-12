<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class product extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "product";

  //대용량할당
  protected $fillable = ['name','ticket','img','product_code','price','on/off'];
}

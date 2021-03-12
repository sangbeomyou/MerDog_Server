<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class hospital_info extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "hospital_info";

  //대용량할당
  protected $fillable = ['doctor_id','name', 'url', 'address', 'intro', 'latitude', 'longitutde' ];

}

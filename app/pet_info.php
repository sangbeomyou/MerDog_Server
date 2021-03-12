<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class pet_info extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "pet_info";

  //대용량할당
  protected $fillable = ['user_id', 'pet_name', 'pet_main_type', 'pet_sub_type', 'pet_gender', 'pet_age', 'pet_birth', 'pet_img', 'pet_notice'];
}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class chat_request extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "chat_request";

  //대용량할당
  protected $fillable = ['user_id', 'doctor_id', 'chat_title', 'chat_content', 'pet_id', 'latitude', 'longitude', 'distance', 'state', 'rating','address','created_at','extra_time'];

}

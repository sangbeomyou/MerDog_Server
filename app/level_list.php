<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class level_list extends Model
{
  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "level_list";

  //대용량할당
  protected $fillable = ['level'];

  public function admin_info()
  {
    return $this->hasMany(admin_info::class);
  }
}

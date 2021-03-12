<?php

namespace App;

// 라라벨 인증 사용
use Illuminate\Foundation\Auth\User as Authenticatable;
// 비밀번호 변경 메일을 위해 필요한 trait
use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;

class admin_info extends Authenticatable
{
  use Notifiable;

  //타임스탬프 자동입력
  public $timestamps = false;
  //DB 이름 연동
  protected $table = "admin_info";

  //대용량할당
  protected $fillable = ['admin_id', 'admin_pw'];

  //조회시 제외할 칼럼
  protected $hidden = ['admin_pw'];

  /*자동 타입변환*/
  // protected $casts = [
  //     'email_verified_at' => 'datetime',
  // ];

  public function level_list()
  {
    return $this->belongsTo(level_list::class);
  }

  public function getAuthPassword(){
    return $this->admin_pw; // case sensitive
  }
}

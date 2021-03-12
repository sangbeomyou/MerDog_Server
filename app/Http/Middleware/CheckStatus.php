<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class CheckStatus
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
      $response = $next($request);
       //If the status is not approved redirect to login
       if(Auth::check() && Auth::user()->level == '1'){
           Auth::logout();
           flash("미승인 상태로 변경되었습니다. 관리자에게 문의해주세요.");
           return redirect('/');
           return false;
       }
       return $response;
    }
}

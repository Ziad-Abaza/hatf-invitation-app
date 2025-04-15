<?php

namespace App\Exceptions;

use Throwable;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Auth\Access\AuthorizationException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Tymon\JWTAuth\Exceptions\TokenBlacklistedException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     */
    public function register(): void
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Throwable  $exception
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * @throws \Throwable
     */
    public function render($request, Throwable $exception)
    {
        if ($request->is('api/*')) {
            if ($request->header('lang')) {
                app()->setlocale($request->header('lang'));
            }

            if ($exception instanceof AuthenticationException) {
                try {
                    JWTAuth::parseToken()->authenticate();
                } catch (TokenExpiredException $e) {
                    return errorResponse(__('site.Token is Expired'), 401);
                } catch (TokenInvalidException $e) {
                    return errorResponse(__('site.Token is Invalid'), 401);
                } catch (TokenBlacklistedException $e) {
                    return errorResponse(__('site.Token is blacklist'), 401);
                } catch (JWTException $e) {
                    return errorResponse(__('site.Authorization Token not found'), 401);
                }

                return errorResponse(__('site.Authorization Token not found'), 401);
            }

            if ($exception instanceof MethodNotAllowedHttpException) {
                return errorResponse($exception->getMessage(), 405);
            }

            if ($exception instanceof NotFoundHttpException) {
                return errorResponse('هذا الرابط ليس مودجود', 404);
            }

            if ($exception instanceof ModelNotFoundException) {
                return errorResponse('هذا العنصر ليس موجود', 404);
            }

            if ($exception instanceof AuthorizationException) {
                return errorResponse('ليس لديك حق الوصول', 403);
            }

            // if (app()->environment() != 'local') {
            //     if ($exception instanceof Throwable) {
            //         return errorResponse($exception->getMessage(), 500);
            //     }
            // }
        }

        return parent::render($request, $exception);
    }
}

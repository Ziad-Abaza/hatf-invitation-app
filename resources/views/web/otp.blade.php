<!DOCTYPE html>
<!-- Coding by CodingLab || www.codinglabweb.com -->
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>OTP Verification Form</title>
    <link rel="stylesheet" href="{{ asset('front/otp/style.css') }}" />
    <!-- Boxicons CSS -->
    <link href="https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet" />
    <script src="{{ asset('front/otp/script.js') }}" defer></script>
</head>

<body>
    <div class="container">
        <h1>رمز التحقق</h1>
        <p style="color: #666666">ادخل الرمز المرسل على جوالك</p>
        <p style="color: #666666"> <span>+966 </span>{{ $phone }}</p>

        @if (session('error'))
            <span id="error-message" style="color: red;">كود التحقق غير صحيح</span>
        @endif

        <form action="{{ route('register.store', $user->code) }}" method="POST">
            @csrf
            <div class="input-field">
                <input type="number" name="code1" />
                <input type="number" name="code2" disabled />
                <input type="number" name="code3" disabled />
                <input type="number" name="code4" disabled />

                <input type="hidden" name="phone" value="{{ $phone }}">
            </div>
            <button>تأكيد</button>
        </form>
        <div class="timer" dir="rtl">
            إرسال الرمز مرة أخرى
            <span class="time"></span>
            د؟
            <button type="button" id="resend">إرسال</button>
        </div>
    </div>
</body>

</html>

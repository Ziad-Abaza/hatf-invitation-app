<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>الصفحة الرئسية</title>
    <link rel="stylesheet" href="{{ asset('front/home_page/css/style.css') }}" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <style>
        /* CSS Reset */
        body {
            margin: 0; /* Remove default margin */
            padding: 0; /* Remove default padding */
        }

        .container {
            padding: 0; /* Remove container padding */
        }

        footer {
            margin: 0; /* Ensure no margin on footer */
            padding: 20px 0; /* Add padding for footer content */
            text-align: center; /* Center footer text */
            width: 100%; /* Full width footer */
        }

    </style>
</head>

<body>

    <div class="container">
        <div class="row text-center" style="
            display: flex;
            justify-content: center;
            align-items: center;
            align-content: center;
            flex-direction: column;
            flex-wrap: nowrap;
            ">
            <div class="col-12" style="">
                <img src="{{asset('front/home_page/img/team.svg')}}" alt="team-img" style="    height: 200px; width: 250px;">
            </div>

            <div class="col-12">
                <img src="{{asset('front/img/logo.svg')}}" style="width: 150px;height:50px;">
            </div>

            <div class="col-12" style="margin-bottom: 20px; padding-right: 5px; padding-left: 5px; text-align: right; word-break: break-word;">
                <p class="info-text" style="padding: 0 20px;">
                    جاء الوقت اللي تقدر فيه تنظم مناسبتك ودخول مدعوّينك عن طريق الباركود، وتعيش تجربة إرسال الدعوة فريدة من نوعها!
                    حمل الآن التطبيق من جوجل بلاي وأبل&nbsp;ستور،&nbsp;واستمتع!
                </p>
            </div>

            <div class="col-12 d-flex justify-content-center" style="">
                <div class="col-5 col-sm-12 mb-2">
                    <a class="btn view_more_btn w-100" href="https://play.google.com/store/apps/details?id=com.daewaqr.app">
                        جوجل بلاي <i class="fab fa-google-play"></i>
                    </a>
                </div>

                <div style="height: 10px;"></div>

                <div class="col-5 col-sm-12 mb-2" style="padding-bottom: 40px;">
                    <a class="btn view_more_btn w-100" href="https://apps.apple.com/us/app/%D8%AF%D8%B9%D9%88%D8%A9-qr/id6673885985">
                        أبل ستور <i class="fab fa-apple"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <footer style="   position: fixed;
   left: 0;
   right: 0;
   bottom: 0;
   width: 100%;
   text-align: center;">
        جميع الحقوق محفوظة لـ هتْف © 2024
    </footer>

</body>

</html>

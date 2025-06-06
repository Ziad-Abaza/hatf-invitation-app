<!DOCTYPE html>
<html lang="ar" dir="rtl">

<head>
    <meta charset="UTF-8">
    <style>
        @font-face {
        font-family: 'Lateef';
        src: url('{{ URL::asset('front/Lateef.ttf') }}') format('truetype');
        font-weight: normal;
        font-style: normal;
        font-display: swap;
        }
        body,* {
            font-family: 'Lateef',Arial;
            margin: 0;
            padding: 0;
        }

        body {
        direction: rtl;
        text-align: right;
        }

        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            margin: 0;
            font-size: 24px;
        }

        .company-info {
            text-align: right;
            font-size: 12px;
            margin-bottom: 20px;
        }

        .customer-info,
        .invoice-info {
            width: 48%;
            display: inline-block;
            vertical-align: top;
            font-size: 12px;
            margin-bottom: 20px;
        }

        .items table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .items th,
        .items td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
            font-size: 12px;
        }

        .items th {
            background: #f5f5f5;
        }

        .tel{
            display: flex;
            gap: 3px;
        }

        .totals {
            float: left;
            width: 100%;
            text-align: right;
            font-size: 14px;
        }

        .totals .label {
            display: inline-block;
            width: 200px;
        }

        .footer {
            text-align: center;
            font-size: 10px;
            margin-top: 30px;
            color: #666;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h1>فاتورة مبيعات</h1>
        </div>

        <div class="company-info">
            <strong>اسم الشركة:</strong> وكالة هتف لخدمات الأعمال ( تطبيق دعوة qr )<br>
            <strong>العنوان:</strong> المملكة العربية السعودية<br>
            <strong>الهاتف:</strong> 966530333218<br>
            <strong>البريد الإلكتروني:</strong> info@hatf.sa
        </div>

        <div class="customer-info">
            <h3>بيانات العميل</h3>
            <strong>الاسم:</strong> {{ $user->name }}<br>
            <strong>الهاتف:</strong> {{ $user->phone }}<br>
            <strong>البريد الإلكتروني:</strong> {{ $user->email }}
        </div>

        <div class="invoice-info">
            <h3>تفاصيل الفاتورة</h3>
            <strong>التاريخ:</strong> {{ \Carbon\Carbon::now()->format('d-m-Y') }}<br>
            <strong>رقم الفاتورة:</strong> {{ $payment->id_payment }}<br>
            <strong>حالة الدفع:</strong> {{ $payment->status == 1 ? 'مكتمل' : 'غير مكتمل' }}
        </div>

        <div class="items">
            <table>
                <thead>
                    <tr>
                        <th>الوصف</th>
                        <th>الكمية</th>
                        <th>السعر الوحدوي</th>
                        <th>الإجمالي</th>
                    </tr>
                </thead>
                @php
                    $invitationName = json_decode($invitation_data['name'])->name_ar;
                    $usersCount = $invitation_data['number_of_users'];
                    $unitPrice = number_format($invitation_data['prise'], 2);
                    $totalPrice = number_format($payment->value, 2);
                @endphp
                <tbody>
                    <tr>
                        <td>{{ $invitationName }} - عدد المستخدمين: {{ $usersCount }}</td>
                        <td>1</td>
                        <td>{{ $unitPrice }} ر.س</td>
                        <td>{{ $totalPrice }} ر.س</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="totals">
            <div><span class="label">الإجمالي الفرعي:</span> {{ number_format($payment->value, 2) }} ر.س</div>
            <div><span class="label">الضريبة (0%):</span> 0.00 ر.س</div>
            <div><span class="label">الإجمالي الكلي:</span> {{ number_format($payment->value, 2) }} ر.س</div>
        </div>

        <div style="clear: both;"></div>

        <div class="footer">
            شكرًا لتعاملكم معنا<br>
        </div>
    </div>
</body>

</html>

<!DOCTYPE html>
<html lang="ar" dir="rtl">

<head>
    <meta charset="UTF-8">
    <style>
        @font-face {
            font-family: 'Tajawal';
            src: url('{{ public_path(' front/Tajawal.ttf') }}') format('truetype');
            font-weight: normal;
            font-style: normal;
            font-display: swap;
        }

        body,* {
            font-family: 'Tajawal', Arial;
            margin: 0;
            padding: 0;
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
            <h1>فاتورة رقم {{ $payment->id }}</h1>
        </div>

        <div class="company-info">
            <strong>اسم الشركة:</strong> هتْف<br>
            <strong>العنوان:</strong> الرياض، السعودية<br>
            <strong>الهاتف:</strong> +966 53 033 3218<br>
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
            <strong>التاريخ:</strong> {{ $payment->created_at->format('Y-m-d') }}<br>
            <strong>رقم المعاملة:</strong> {{ $payment->payment_uuid }}<br>
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
                <tbody>
                    <tr>
                        <td>باقة الدعوات - {{ $user_package->invitation_id }}</td>
                        <td>1</td>
                        <td>{{ number_format($payment->value, 2) }} ر.س</td>
                        <td>{{ number_format($payment->value, 2) }} ر.س</td>
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
            هذا المستند إلكتروني ولا يحتاج توقيع.
        </div>
    </div>
</body>

</html>

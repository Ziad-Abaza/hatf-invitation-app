<!DOCTYPE html>
<html lang="ar" dir="rtl">

<head>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: "Tajawal", sans-serif;
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
            text-align: left;
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
            <h1>فاتورة رقم {{ $invoice->id }}</h1>
        </div>

        <div class="company-info">
            <strong>اسم الشركة:</strong> شركتنا المحترمة<br>
            <strong>العنوان:</strong> الرياض، السعودية<br>
            <strong>الهاتف:</strong> 0123456789
        </div>

        <div class="customer-info">
            <h3>بيانات العميل</h3>
            <strong>الاسم:</strong> {{ $client->name }}<br>
            <strong>الهاتف:</strong> {{ $client->phone }}<br>
            <strong>البريد الإلكتروني:</strong> {{ $client->email }}
        </div>

        <div class="invoice-info">
            <h3>تفاصيل الفاتورة</h3>
            <strong>التاريخ:</strong> {{ $invoice->created_at->format('Y-m-d') }}<br>
            <strong>رقم المعاملة:</strong> {{ $invoice->payment_uuid }}
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
                    @foreach($invoice->items as $item)
                    <tr>
                        <td>{{ $item['description'] }}</td>
                        <td>{{ $item['quantity'] }}</td>
                        <td>{{ number_format($item['unit_price'], 2) }}</td>
                        <td>{{ number_format($item['quantity'] * $item['unit_price'], 2) }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="totals">
            <div><span class="label">الإجمالي الفرعي:</span> {{ number_format($invoice->sub_total, 2) }} ر.س</div>
            <div><span class="label">الضريبة ({{ $invoice->tax_rate }}%):</span> {{ number_format($invoice->tax_amount,
                2) }} ر.س</div>
            <div><span class="label">الإجمالي الكلي:</span> {{ number_format($invoice->total, 2) }} ر.س</div>
        </div>

        <div style="clear: both;"></div>

        <div class="footer">
            شكرًا لتعاملكم معنا<br>
            هذا المستند إلكتروني ولا يحتاج توقيع.
        </div>
    </div>
</body>

</html>

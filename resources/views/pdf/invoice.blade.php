<!DOCTYPE html>
<html lang="ar" dir="rtl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>فاتورة</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }

        .invoice {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            color: #333;
        }

        .details {
            margin-bottom: 20px;
        }

        .details table {
            width: 100%;
            border-collapse: collapse;
        }

        .details table td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        .details table tr:last-child td {
            border-bottom: none;
        }

        .footer {
            text-align: center;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>

<body>
    <div class="invoice">
        <div class="header">
            <h1>فاتورة</h1>
        </div>
        <div class="details">
            <table>
                <tr>
                    <td><strong>اسم العميل:</strong></td>
                    <td>{{ $client['name'] }}</td>
                </tr>
                <tr>
                    <td><strong>رقم الجوال:</strong></td>
                    <td>{{ $client['phone'] }}</td>
                </tr>
                <tr>
                    <td><strong>تاريخ العملية:</strong></td>
                    <td>{{ $invoice['date'] }}</td>
                </tr>
                <tr>
                    <td><strong>المبلغ المدفوع:</strong></td>
                    <td>{{ $invoice['amount'] }} ريال</td>
                </tr>
                <tr>
                    <td><strong>رقم العملية:</strong></td>
                    <td>{{ $invoice['transaction_id'] }}</td>
                </tr>
            </table>
        </div>
        <div class="footer">
            شكراً لاختياركم خدماتنا!
        </div>
    </div>
</body>

</html>

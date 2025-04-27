<!DOCTYPE html>
<html lang="ar" dir="rtl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>فاتورة رقم {{ $invoice['id'] }}</title> <!-- تعديل هنا للوصول إلى المصفوفة -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            direction: rtl;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
            color: #333;
        }

        .invoice-container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .invoice-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .invoice-header h2 {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        .invoice-header p {
            font-size: 14px;
            color: #7f8c8d;
        }

        .invoice-body {
            margin-top: 20px;
        }

        .client-info {
            margin-bottom: 20px;
        }

        .client-info p {
            font-size: 14px;
            margin: 5px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table th {
            background-color: #2c3e50;
            color: #fff;
            padding: 10px;
            text-align: center;
            font-weight: bold;
        }

        table td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        .total {
            margin-top: 20px;
            text-align: right;
            font-size: 18px;
            font-weight: bold;
            color: #e74c3c;
        }

        .invoice-footer {
            margin-top: 30px;
            text-align: center;
            font-size: 14px;
            color: #7f8c8d;
        }
    </style>
</head>

<body>
    <div class="invoice-container">
        <!-- Header -->
        <div class="invoice-header">
            <h2>فاتورة رقم {{ $invoice['id'] }}</h2> <!-- تعديل هنا للوصول إلى المصفوفة -->
            <p>التاريخ: {{ $invoice['date'] }}</p> <!-- تعديل هنا للوصول إلى المصفوفة -->
        </div>

        <!-- Body -->
        <div class="invoice-body">
            <!-- Client Info -->
            <div class="client-info">
                <p><strong>العميل:</strong> {{ $client['name'] }}</p> <!-- تعديل هنا للوصول إلى المصفوفة -->
                <p><strong>البريد الإلكتروني:</strong> {{ $client['email'] }}</p> <!-- تعديل هنا للوصول إلى المصفوفة -->
            </div>

            <!-- Items Table -->
            <table>
                <thead>
                    <tr>
                        <th>المنتج</th>
                        <th>الكمية</th>
                        <th>السعر</th>
                        <th>الإجمالي</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($invoice['items'] as $item)
                    <!-- تعديل هنا للوصول إلى المصفوفة -->
                    <tr>
                        <td>{{ $item['name'] }}</td> <!-- تعديل هنا للوصول إلى المصفوفة -->
                        <td>{{ $item['quantity'] }}</td> <!-- تعديل هنا للوصول إلى المصفوفة -->
                        <td>{{ $item['price'] }}</td> <!-- تعديل هنا للوصول إلى المصفوفة -->
                        <td>{{ $item['total'] }}</td> <!-- تعديل هنا للوصول إلى المصفوفة -->
                    </tr>
                    @endforeach
                </tbody>
            </table>

            <!-- Total -->
            <p class="total">المجموع الكلي: {{ $invoice['total'] }} ريال</p> <!-- تعديل هنا للوصول إلى المصفوفة -->
        </div>

        <!-- Footer -->
        <div class="invoice-footer">
            <p>شكراً لتعاملكم معنا! إذا كانت لديك أي استفسارات، يرجى التواصل معنا عبر البريد الإلكتروني:
                support@example.com</p>
        </div>
    </div>
</body>

</html>

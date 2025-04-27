<!-- resources/views/invoice.blade.php -->
<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .invoice-box {
            max-width: 800px;
            margin: auto;
            padding: 30px;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .details {
            margin-bottom: 20px;
        }

        .details table {
            width: 100%;
            border-collapse: collapse;
        }

        .details td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        .total {
            text-align: right;
            margin-top: 20px;
            font-weight: bold;
        }
    </style>
</head>

<body>
    <div class="invoice-box">
        <div class="header">
            <h1>فاتورة ضريبية</h1>
        </div>
        <div class="details">
            <table>
                <tr>
                    <td>اسم العميل</td>
                    <td>{{ $clientName }}</td>
                </tr>
                <tr>
                    <td>رقم الفاتورة</td>
                    <td>{{ $invoiceNumber }}</td>
                </tr>
                <tr>
                    <td>التاريخ</td>
                    <td>{{ $date }}</td>
                </tr>
                <tr>
                    <td>المبلغ الإجمالي</td>
                    <td>{{ $totalAmount }} ريال</td>
                </tr>
            </table>
        </div>
        <div class="total">
            شكراً لاختياركم خدماتنا
        </div>
    </div>
</body>

</html>

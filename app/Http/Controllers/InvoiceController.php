<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade as PDF;  // تأكد من أنك قد قمت بتثبيت هذه المكتبة

class InvoiceController extends Controller
{
    public function sendInvoice(Request $request)
    {
        // بيانات الفاتورة والعميل
        $invoiceData = (object) $request->invoice;  // تحويل إلى كائن
        $clientData = (object) $request->client;    // تحويل إلى كائن
        $phone = $request->phone;

        $pdfFilePath = generateInvoicePDF($invoiceData, $clientData);


        // إرسال الفاتورة عبر واتساب
        $result = sendInvoiceViaWhatsapp($phone, $pdfFilePath);

        // التحقق من نتيجة إرسال الفاتورة
        if ($result) {
            return response()->json(['message' => 'Invoice sent successfully!'], 200);
        }

        return response()->json(['message' => 'Error sending invoice!'], 500);
    }
}

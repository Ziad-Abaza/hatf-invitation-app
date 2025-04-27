<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class InvoiceController extends Controller
{
    public function sendInvoice(Request $request)
    {
        $invoiceData = $request->invoice;
        $clientData = $request->client;
        $phone = $request->phone;

        $pdfFilePath = generateInvoicePDF($invoiceData, $clientData);

        $result = sendInvoiceViaWhatsapp($phone, $pdfFilePath);

        if ($result) {
            return response()->json(['message' => 'Invoice sent successfully!'], 200);
        }

        return response()->json(['message' => 'Error sending invoice!'], 500);
    }
}

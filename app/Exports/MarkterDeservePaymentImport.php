<?php

namespace App\Exports;

use App\Models\User;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use App\Http\Resources\Excel\MarkterDeservePaymentImportResource;

class MarkterDeservePaymentImport implements FromCollection, WithHeadings, WithStyles
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        // Return the collection of users with totalPaymentValue > 0
        return MarkterDeservePaymentImportResource::collection(
            User::all()->filter(fn($user) => $user->totalPaymentValue($user->id) > 0)
        );
    }

    /**
     * Define the headers for the Excel sheet.
     *
     * @return array
     */
    public function headings(): array
    {
        return [
            'رقم',            // ID
            'اسم المسوق',      // Name
            'البريد الالكتروني', // Email
            'هاتف المسوق',     // Phone
            'رمز المسوق',      // Code
            'رقم الحساب',      // Code
            'عدد العملاء',     // Number of Clients
            'رابط المسوق',     // Marketer URL
            'المبالغ المستحقة' // Payment Amount Due
        ];
    }

    /**
     * Style the first row as bold text with a background color.
     *
     * @param Worksheet $sheet
     * @return array
     */
    public function styles(Worksheet $sheet)
    {
        return [
            // Style the headers row.
            1 => [
                'font' => [
                    'bold' => true,
                    'color' => ['rgb' => 'FFFFFF'], // White font color
                ],
                'fill' => [
                    'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                    'startColor' => ['rgb' => '4CAF50'], // Green background color
                ],
                'alignment' => [
                    'horizontal' => \PhpOffice\PhpSpreadsheet\Style\Alignment::HORIZONTAL_CENTER,
                ],
            ],
        ];
    }
}

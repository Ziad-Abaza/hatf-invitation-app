<?php

namespace App\Exports;

use App\Models\TransferredAmount;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use App\Http\Resources\Excel\MarkterTransferedPaymentImportResource;

class MarkterTransferedPaymentImport implements FromCollection, WithHeadings, WithStyles
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        return MarkterTransferedPaymentImportResource::collection(TransferredAmount::all());
    }

    /**
     * Define the headers for the Excel sheet.
     *
     * @return array
     */
    public function headings(): array
    {
        return [
            'رقم',          
            'اسم المسوق',     
            'المبلغ',
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

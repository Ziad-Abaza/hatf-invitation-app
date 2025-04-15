@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-2"><span class="text-muted fw-light">لوحة التحكم /</span>{{$slug_ar}}</h4>

        <div class="card">
            <div class="table-responsive">
                <table class="table table-hover table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th>المعرف</th>
                            <th>معرف الدفع</th>
                            <th>الحالة</th>
                            <th>القيمة</th>
                            <th>معرف دعوة المستخدم</th>
                            <th>تاريخ الإنشاء</th>
                            <th>تاريخ التحديث</th>
                            <th>UUID الدفع</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($payments as $payment)
                            <tr>
                                <td>{{ $payment->id }}</td>
                                <td>
                                    @if($payment->id_payment)
                                        {{ $payment->id_payment }}
                                    @else
                                        <i class="fas fa-ban text-muted" title="غير متوفر"></i>
                                    @endif
                                </td>
                                <td>
                                    <span class="badge {{ $payment->status == 1 ? 'bg-success' : 'bg-danger' }}">
                                        {{ $payment->status == 1 ? 'ناجح' : 'فشل' }}
                                    </span>
                                </td>
                                <td>{{ $payment->value }}</td>
                                <td>
                                    @if($payment->user_invitation_id)
                                        {{ $payment->user_invitation_id }}
                                    @else
                                        <i class="fas fa-ban text-muted" title="غير متوفر"></i>
                                    @endif
                                </td>
                                <td>
                                    {{ $payment->created_at ? $payment->created_at->format('Y-m-d H:i:s') : '<i class="fas fa-ban text-muted" title="غير متوفر"></i>' }}
                                </td>
                                <td>
                                    {{ $payment->updated_at ? $payment->updated_at->format('Y-m-d H:i:s') : '<i class="fas fa-ban text-muted" title="غير متوفر"></i>' }}
                                </td>
                                <td>
                                    @if($payment->payment_uuid)
                                        {{ $payment->payment_uuid }}
                                    @else
                                        <i class="fas fa-ban text-muted" title="غير متوفر"></i>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="d-flex justify-content-center mt-3" style="gap: 15px;">
                {{ $payments->links() }}
            </div>
        </div>
        
        
        
        

    </div>
@endsection

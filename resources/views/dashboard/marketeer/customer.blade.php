@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y" dir="rtl">
        <h4 class="py-2"><span class="text-muted fw-light">لوحة التحكم /</span> عملاء {{ $user->name }}</h4>

        {{-- <div class="col-lg-4 pb-4">
            <div class="demo-inline-spacing">
                <a href="{{ route('dashboard.marketeer.create') }}" class="btn btn-primary" style="color: #fff">
                    إضافة مسوق
                </a>
            </div>
        </div> --}}

        <!-- Hoverable Table rows -->
        <div class="card">
            {{-- <h5 class="card-header">Hoverable rows</h5> --}}
            <div class="table-responsive text-nowrap">
                <table class="table table-hover text-center">

                    <thead>
                        <tr>
                            <th>رقم العميل</th>
                            <th>اسم المسوق</th>
                            <th>البريد الالكتروني</th>
                            <th>هاتف المسوق</th>
                            <th>رمز المسوق</th>
                        </tr>
                    </thead>

                    <tbody class="table-border-bottom-0">
                        @foreach ($customers as $customer)
                            <tr>
                                <td>
                                    <span class="fw-medium">{{ $customer->id }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $customer->name }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $customer->email }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $customer->phone }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $customer->code }}</span>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        <!--/ Hoverable Table rows -->
    </div>
@endsection

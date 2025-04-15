@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y" dir="rtl">
        <h4 class="py-2"><span class="text-muted fw-light">لوحة التحكم /</span> المسوق</h4>

        <div class="col-lg-4 pb-4">
            <div class="demo-inline-spacing">
                <!-- Hoverable Table rows -->

                <x-link-button url="{{ route('dashboard.marketeer.export') }}">
                    <i class="fas fa-file-export"></i> Export Marketeers
                </x-link-button>

                {{-- <a href="{{ route('dashboard.marketeer.create') }}" class="btn btn-primary" style="color: #fff">
                    إضافة مسوق
                </a> --}}
            </div>
        </div>


        <div class="card">
            {{-- <h5 class="card-header">Hoverable rows</h5> --}}

            <div class="table-responsive text-nowrap">
                <table class="table table-hover text-center">

                    <thead>
                        <tr>
                            <th>ترتيب</th>
                            <th>اسم المسوق</th>
                            <th>البريد الالكتروني</th>
                            <th>هاتف المسوق</th>
                            <th>رمز المسوق</th>
                            <th>رقم الحساب(IBAN)</th>
                            <th>عدد العملاء</th>
                            <th>رابط المسوق</th>
                            <th>المبالغ المستحقة</th>
                            <th>العمليات</th>
                        </tr>
                    </thead>

                    <tbody class="table-border-bottom-0">
                        @foreach ($users as $user)
                            @if ($user->totalPaymentValue($user->id))
                                <tr>
                                    <td>
                                        <span class="fw-medium">{{ $user->id }}</span>
                                    </td>
                                    <td>
                                        <span class="fw-medium">{{ $user->name }}</span>
                                    </td>
                                    <td>
                                        <span class="fw-medium">{{ $user->email }}</span>
                                    </td>
                                    <td>
                                        <span class="fw-medium">{{ $user->phone }}</span>
                                    </td>
                                    <td>
                                        <span class="fw-medium">{{ $user->code }}</span>
                                    </td>
                                    <td>
                                        <span class="fw-medium">{{ $user->iban ?? '' }}</span>
                                    </td>
                                    <td>
                                        <span class="fw-medium">{{ App\Models\User::getUsersByReferral($user->id) }}</span>
                                    </td>
                                    <td><a href="{{ $user->url }}" target="_blank"> رابط المسوق</a>
                                    </td>
                                    <td>${{ round($user->totalPaymentValue($user->id), 2) }}</td>

                                    <td>
                                        <div class="dropdown">
                                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                                data-bs-toggle="dropdown">
                                                <i class="ti ti-dots-vertical"></i>
                                            </button>
                                            @if ($user->code)
                                                <div class="dropdown-menu">
                                                    <a class="dropdown-item"
                                                        href="{{ route('dashboard.marketeer.customer.index', ['code' => $user->code]) }}">
                                                        <i class="fa-solid fa-eye"></i>
                                                        {{-- <i class="ti ti-pencil me-1"></i> --}}
                                                        عرض العملاء</a>

                                                    <a class="dropdown-item"
                                                        href="{{ route('dashboard.marketeer.withdrawals.index', ['user' => $user->id]) }}">
                                                        <i class="fa-solid fa-plus"></i>
                                                        اضافة سحب</a>

                                                    <form
                                                        action="{{ route('dashboard.transferred.store', ['markterId' => $user->id]) }}"
                                                        method="POST" style="display: inline;">
                                                        @csrf
                                                        <button type="submit" class="dropdown-item"
                                                            class="btn btn-primary"> <i class="fa-solid fa-wallet"></i>
                                                            دفع النقود
                                                        </button>
                                                    </form>



                                                    {{-- <a class="dropdown-item"
                                                href="{{ route('dashboard.marketeer.edit', $marketeer->id) }}"><i
                                                    class="ti ti-pencil me-1"></i> تعديل</a> --}}

                                                    {{-- <a class="dropdown-item"
                                                href="{{ route('dashboard.marketeer.delete', $marketeer->id) }}"><i
                                                    class="ti ti-trash me-1"></i>
                                                حذف</a> --}}

                                                </div>
                                            @endif

                                        </div>
                                    </td>
                                </tr>
                            @endif
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        <!--/ Hoverable Table rows -->
    </div>
@endsection

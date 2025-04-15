@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 mb-4"><span class="text-muted fw-light">لوحة التحكم /</span> القاعات</h4>

        <div class="col-lg-4 pb-4">
            <div class="demo-inline-spacing">
                <x-link-button url="{{ route('dashboard.hall.create') }}">
                    انشاء قاعة
                </x-link-button>
            </div>
        </div>

        <!-- Hoverable Table rows -->
        <div class="card">
            <h5 class="card-header">القاعات</h5>
            <div class="table-responsive text-nowrap">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <table class="table table-hover">

                    <thead>
                        <tr>
                            <th>الرقم التعريفي</th>
                            <th>الاسم</th>
                            <th>البريد الالكتروني</th>
                            <th>رقم الهاتف</th>
                            <th>موقع الكتروني</th>
                            <th>نبذة عن القاعة</th>
                            <th>أجراءات</th>
                        </tr>
                    </thead>

                    <tbody class="table-border-bottom-0">
                        @foreach ($halls as $hall)
                            <tr>
                                <td>
                                    <span class="fw-medium">{{ $hall->id }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $hall->name }}</span>
                                </td>
                                <td>{{ $hall->email }}</td>
                                <td>{{ $hall->phone }}</td>
                                <td><a href="{{ $hall->url }}">{{ $hall->url }}</a></td>
                                <td>{{ $hall->desc }}</td>
                                {{-- <td>
                                    <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                                        <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top"
                                            class="avatar avatar-xs pull-up" title="Lilian Fuller">
                                            <img src="{{ asset('storage/images/' . $hall->image) }}" alt="Avatar"
                                                class="rounded-circle" />
                                        </li>
                                    </ul>
                                </td> --}}
                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                            <i class="ti ti-dots-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="{{ route('dashboard.hall.edit', $hall->id) }}"><i
                                                    class="ti ti-pencil me-1"></i> تعديل</a>
                                            <a class="dropdown-item"
                                                href="{{ route('dashboard.hall.delete', $hall->id) }}"><i
                                                    class="ti ti-trash me-1"></i>
                                                حذف</a>
                                        </div>
                                    </div>
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

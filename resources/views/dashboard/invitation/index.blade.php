@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-2"><span class="text-muted fw-light">لوحة التحكم /</span> الدعوات</h4>

        <div class="col-lg-4 pb-4">
            <div class="demo-inline-spacing">
                <x-link-button url="{{ route('dashboard.invitation.create') }}">
                    إنشاء دعوة
                </x-link-button>

                <x-link-button url="{{ route('dashboard.invitation.createPrivate') }}">
                    إنشاء دعوة مؤقتة
                </x-link-button>
                
            </div>
        </div>

        <!-- Hoverable Table rows -->
        <div class="card">
            {{-- <h5 class="card-header">Hoverable rows</h5> --}}
            <div class="table-responsive text-nowrap">
                <table class="table table-hover">

                    <thead>
                        <tr>
                            <th>الاسم</th>
                            <th>عدد الاشخاص</th>
                            <th>سعر الدعوة</th>
                            <th>الصورة</th>
                            <th>تاريخ الحد الأقصى</th>
                            <th>الاجراءات</th>
                        </tr>
                    </thead>

                    <tbody class="table-border-bottom-0">
                        @foreach ($invitations as $invitation)
                            <tr>
                                <td>
                                    <span class="fw-medium">{{ $invitation->name }}</span>
                                </td>
                                <td>{{ $invitation->number_of_users }}</td>
                                <td>{{ $invitation->prise }}</td>
                                <td>
                                    <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                                        <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top"
                                            class="avatar avatar-xs pull-up" title="Lilian Fuller">
                                            <img src="{{ $invitation->getFirstMediaUrl('default') }}" alt="Avatar"
                                                class="rounded-circle" />
                                        </li>
                                    </ul>
                                </td>
                                <td>
                                    @switch($invitation->max_date)
                                        @case('day')
                                            <span class="badge bg-primary">
                                                <i class="fas fa-calendar-day"></i> يوم
                                            </span>
                                            @break
                                        @case('month')
                                            <span class="badge bg-success">
                                                <i class="fas fa-calendar-alt"></i> شهر
                                            </span>
                                            @break
                                        @case('year')
                                            <span class="badge bg-warning">
                                                <i class="fas fa-calendar-year"></i> سنة
                                            </span>
                                            @break
                                        @case('unlimited')
                                            <span class="badge bg-info">
                                                <i class="fas fa-infinity"></i> غير محدود
                                            </span>
                                            @break
                                        @default
                                            <span class="badge bg-secondary">غير معروف</span>
                                    @endswitch
                                </td>
                                
                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                            <i class="ti ti-dots-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item"
                                                href="{{ route('dashboard.invitation.edit', $invitation->id) }}"><i
                                                    class="ti ti-pencil me-1"></i> تعديل</a>
                                            <a class="dropdown-item"
                                                href="{{ route('dashboard.invitation.delete', $invitation->id) }}"><i
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

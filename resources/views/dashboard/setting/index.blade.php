@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 mb-4"><span class="text-muted fw-light">لوحة التحكم /</span> الاعدادات</h4>

        <!-- Hoverable Table rows -->
        <div class="card">
            <div class="table-responsive text-nowrap">
                <table class="table table-hover">

                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Instagram</th>
                            <th>created_at</th>
                            <th>updated_at</th>
                            <th>Actions</th>
                        </tr>
                    </thead>

                    <tbody class="table-border-bottom-0">
                        @foreach ($settings as $setting)
                            <tr>
                                <td>
                                    <span class="fw-medium">{{ $setting->id }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $setting->instagram }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $setting->created_at }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $setting->updated_at }}</span>
                                </td>

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                            <i class="ti ti-dots-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item"
                                                href="{{ route('dashboard.setting.edit', $setting->id) }}"><i
                                                    class="ti ti-pencil me-1"></i> Edit</a>
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

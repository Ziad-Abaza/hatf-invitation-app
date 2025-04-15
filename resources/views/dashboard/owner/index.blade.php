@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-2"><span class="text-muted fw-light">Dashboard /</span> Admins</h4>

        <!-- Hoverable Table rows -->
        <div class="card">
            {{-- <h5 class="card-header">Hoverable rows</h5> --}}
            <div class="table-responsive text-nowrap">
                <table class="table table-hover">

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Suppliers</th>
                            <th>Clients</th>
                            <th>Representatives</th>
                            <th>Products</th>
                            <th>Restrictions</th>
                            <th>Invoice Purchases</th>
                            <th>Invoice Sales</th>
                            <th>Created At</th>
                            {{-- <th>Actions</th> --}}
                        </tr>
                    </thead>

                    <tbody class="table-border-bottom-0">
                        @foreach ($owners as $owner)
                            <tr>
                                <td>
                                    <span class="fw-medium">{{ $owner->id }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $owner->name }}</span>
                                </td>
                                <td>{{ $owner->email }}</td>
                                <td>{{ $owner->suppliers_count }}</td>
                                <td>{{ $owner->clients_count }}</td>
                                <td>{{ $owner->representatives_count }}</td>
                                <td>{{ $owner->products_count }}</td>
                                <td>{{ $owner->restrictions_count }}</td>
                                <td>{{ $owner->purchases_count }}</td>
                                <td>{{ $owner->invoice_sales_count }}</td>
                                <td>{{ $owner->created_at }}</td>


                                {{-- <td><span class="badge bg-label-primary me-1">Active</span></td> --}}

                                {{-- <td>
                                    <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                                        <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top"
                                            class="avatar avatar-xs pull-up" title="Lilian Fuller">
                                            <img src="{{ asset('storage/images/' . $owner->image) }}" alt="Avatar"
                                                class="rounded-circle" />
                                        </li>
                                    </ul>
                                </td> --}}

                                {{-- <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                            <i class="ti ti-dots-vertical"></i>
                                        </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="{{ route('dashboard.admin.edit', $admin->id) }}"><i
                                                    class="ti ti-pencil me-1"></i> Edit</a>
                                            <a class="dropdown-item" href="javascript:void(0);"><i
                                                    class="ti ti-trash me-1"></i>
                                                Delete</a>
                                        </div>
                                    </div>
                                </td> --}}

                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        <!--/ Hoverable Table rows -->

    </div>
@endsection

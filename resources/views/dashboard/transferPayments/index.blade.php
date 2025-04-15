@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y" dir="rtl">
        <h4 class="py-2"><span class="text-muted fw-light">لوحة التحكم /</span> المدفوعات</h4>

        <div class="col-lg-4 pb-4">
            <div class="row">
                <div class="col-lg-4 pb-4">
                    <!-- Export Button for Excel -->
                    <x-link-button url="{{ route('dashboard.transferred.export') }}">
                        <i class="fas fa-file-export"></i> تصدير
                    </x-link-button>
                </div>

                {{-- <div class="col-lg-4 pb-4">
                    <!-- Button for Deleting All Records -->
                    <form action="{{ route('dashboard.transferred.destroy_all') }}" method="POST" style="display: inline;">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-danger" style="padding: 8px 16px;">
                            <i class="fa-solid fa-trash"></i> مسح الكل
                        </button>
                    </form>                    
                </div> --}}
            </div>
        </div>

        <div class="card">
            <div class="table-responsive text-nowrap">
                <table class="table table-hover text-center">
                    <thead>
                        <tr>
                            <th>ترتيب</th>
                            <th>اسم المسوق</th>
                            <th>المبلغ</th>
                            <th>اجمالى مبالغ العمليات</th>
                            <th>العمليات</th>
                        </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                        @foreach ($transferredAmounts as $transferredAmount)
                            <tr>
                                <td>
                                    <span class="fw-medium">{{ $transferredAmount->id }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $transferredAmount->user->name }}</span>
                                </td>
                                <td>
                                    <span class="fw-medium">{{ $transferredAmount->amount }}</span>
                                </td>
                                <td>
                                    <!-- Button to trigger the modal -->
                                    <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#historyModal{{ $transferredAmount->id }}">
                                        عرض التاريخ
                                    </button>
                                                                  
                                    <!-- Modal -->
                                    <div class="modal fade" id="historyModal{{ $transferredAmount->id }}" tabindex="-1" aria-labelledby="historyModalLabel{{ $transferredAmount->id }}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="historyModalLabel{{ $transferredAmount->id }}">تاريخ المدفوعات</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="list-unstyled">
                                                        @foreach (json_decode($transferredAmount->history, true) as $item)
                                                            <li class="pb-2">
                                                                <div class="card">
                                                                    <div class="card-body p-2">
                                                                        <span class="fw-bold">المبلغ:</span> {{ $item['value'] }}
                                                                        <br>
                                                                        <span class="text-muted">تاريخ:</span>
                                                                        {{ \Carbon\Carbon::parse($item['created_at'])->diffForHumans() }}
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">إغلاق</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                

                                <td>
                                    <div class="dropdown">
                                        <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                            data-bs-toggle="dropdown">
                                            <i class="ti ti-dots-vertical"></i> <!-- Correct usage of icon -->
                                        </button>
                                        <div class="dropdown-menu">
                                            <!-- Button for Deleting a Single Record -->
                                            <form
                                                action="{{ route('dashboard.transferred.destroy', ['transferredAmount' => $transferredAmount->id]) }}"
                                                method="POST" style="display: inline;">
                                                @csrf
                                                @method('DELETE') <!-- DELETE method for deleting a single record -->
                                                <button type="submit" class="dropdown-item"
                                                    style="background: none; border: none; padding: 0;">
                                                    <i class="fa-solid fa-trash"></i> مسح
                                                </button>
                                            </form>
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

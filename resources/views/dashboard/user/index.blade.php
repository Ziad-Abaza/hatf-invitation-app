@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-2"><span class="text-muted fw-light">لوحة التحكم /</span>{{ $slug_ar }}</h4>

        @if ($slug_en == 'total_markters')
            <div style="margin-bottom: 10px">
                <x-link-button url="{{ route('dashboard.marketeer.create') }}">
                    انشاء مسوق
                </x-link-button>
            </div>
        @endif

        <div class="card">
            <div class="table-responsive">
                <table class="table table-hover table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th>الأسم</th>
                            <th>البريد الالكتروني</th>
                            <th>رقم الهاتف</th>
                            <th>اللنك</th>
                            @if ($slug_en == 'total_markters')
                                <th>المبالغ المستحقة</th>
                                <th>عدد العملاء</th>
                            @endif
                            <th>المحفظة</th>
                            <th>الدعوات</th>
                            <th>العضوية</th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach ($users as $user)
                            <tr>
                                <td>
                                    <span class="fw-medium">{{ $user->name }}</span>
                                </td>
                                <td>{{ $user->email }}</td>
                                <td>{{ $user->phone }}</td>
                                <td>
                                    <a href="{{ $user->url }}" target="_blank"
                                        class="text-decoration-none">{{ $user->url }}</a>
                                </td>
                                @if ($slug_en == 'total_markters')
                                    <td>${{ $user->totalPaymentValue($user->id) }}</td>
                                    <td>{{ App\Models\User::getUsersByReferral($user->id) }}</td>
                                @endif
                                <td>{{ $user->wallet }}</td>
                                <td>
                                    {{ $user->userInvitations->count() }}
                                </td>
                                <td>
                                    @if ($user->subscription == 'ordinary')
                                        <!-- Button for Ordinary users -->
                                        <form action="{{ route('dashboard.users.promotion', $user->id) }}" method="POST">
                                            @csrf
                                            <button type="submit" class="btn btn-primary w-100">
                                                <i class="fas fa-arrow-up"></i> Promote to VIP
                                            </button>
                                        </form>
                                    @else
                                        <!-- Button for VIP users -->
                                        <form action="{{ route('dashboard.users.promotion', $user->id) }}" method="POST">
                                            @csrf
                                            <button type="submit" class="btn btn-success w-100">
                                                <i class="fas fa-star"></i> VIP Member
                                            </button>
                                        </form>
                                    @endif
                                </td>

                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>

            <div class="d-flex justify-content-center" style="margin-top: 30px;">
                {{ $users->links() }}
            </div>
        </div>



    </div>
@endsection

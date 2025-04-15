@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-2"><span class="text-muted fw-light">إنشاء /</span> مسوق</h4>

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        @if (session()->has('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif


        <!-- Form to Add User -->
        <div class="card">
            <div class="card-body">
                <form action="{{ route('dashboard.marketeer.store') }}" method="POST">
                    @csrf
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="name" class="form-label">الاسم*</label>
                            <input type="text" id="name" name="name" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">البريد الإلكتروني</label>
                            <input type="email" id="email" name="email" class="form-control">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="phone" class="form-label">رقم الهاتف</label>
                            <input type="text" id="phone" name="phone" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label for="password" class="form-label">كلمة المرور</label>
                            <input type="password" id="password" name="password" class="form-control">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="bank_name" class="form-label">اسم البنك</label>
                            <input type="text" id="bank_name" name="bank_name" class="form-control">
                        </div>
                        <div class="col-md-6">
                            <label for="iban" class="form-label">رقم الآيبان</label>
                            <input type="text" id="iban" name="iban" class="form-control">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="referral_id" class="form-label">اضافة لمستخدم</label>
                        <select id="referral_id" name="referral_id" class="form-control">
                            <option value="">-- اختر --</option>
                            @foreach ($users as $user)
                                <option value="{{ $user->id }}">{{ $user->name }}</option>
                            @endforeach
                        </select>
                    </div>


                    <button type="submit" class="btn btn-primary">حفظ</button>
                </form>
            </div>
        </div>
    </div>
@endsection

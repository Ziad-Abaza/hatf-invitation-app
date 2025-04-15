@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y" dir="rtl">
        <h4 class="py-3 mb-4"><span class="text-muted fw-light">لوحة التحكم/</span> إضافة سحب</h4>

        <!-- Basic Layout -->
        <div class="row">
            <div class="col-xl">
                <div class="card mb-12">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0 text-start"> إضافة عملية سحب </h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('dashboard.marketeer.withdrawals.save',  $user->code) }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-value">قيمة السحب</label>
                                    <input type="number" name="value"
                                        class="form-control @error('value') is-invalid @enderror" value="{{ old('value') }}"
                                        id="basic-default-value" placeholder="اكتب قيمة السحب للمسوق" />
                                    @error('value')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>

                            <x-button type="submit" >
                                إنشاء                         
                             </x-button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

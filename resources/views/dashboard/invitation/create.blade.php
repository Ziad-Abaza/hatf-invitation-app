@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 mb-4"><span class="text-muted fw-light">لوحة التحكم /</span> الدعوات / إنشاء</h4>

        <!-- Basic Layout -->
        <div class="row">
            <div class="col-xl">
                <div class="card mb-12">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">إنشاء دعوة</h5>
                        {{-- <small class="text-muted float-end">Default label</small> --}}
                    </div>
                    <div class="card-body">
                        <form action="{{ route('dashboard.invitation.store') }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf

                            <div class="row justify-content-between">

                                <div class="row justify-content-between">
                                    <div class="col-6 mb-3">
                                        <label class="form-label" for="basic-default-name">الاسم</label>
                                        <input type="text" name="name" placeholder="الاسم"
                                            class="form-control @error('name') is-invalid @enderror"
                                            id="basic-default-name" />
                                        @error('name')
                                            <div
                                                class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>

                                    <div class="col-6 mb-3">
                                        <label class="form-label" for="basic-default-number">عدد الاشخاص</label>
                                        <div class="input-group input-group-merge">
                                            <input type="number" name="number_of_users" id="basic-default-number"
                                                placeholder="عدد الاشخاص"
                                                class="form-control @error('number_of_users') is-invalid @enderror"
                                                aria-describedby="basic-default-number" />

                                            @error('number_of_users')
                                                <div
                                                    class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-6 mb-3">
                                        <label class="form-label" for="basic-default-prise">سعر الدعوة</label>
                                        <div class="input-group input-group-merge">
                                            <input type="number" name="prise" id="basic-default-prise"
                                                placeholder="سعر الدعوة"
                                                class="form-control @error('prise') is-invalid @enderror"
                                                aria-describedby="basic-default-prise" />
                                            @error('prise')
                                                <div
                                                    class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-6 mb-3">
                                        <label for="formFile" class="form-label">تحميل صور الدعوة</label>
                                        <input type="file" name="image"
                                            class="form-control @error('image') is-invalid @enderror" id="formFile" />
                                        @error('image')
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

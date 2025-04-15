@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 mb-4"><span class="text-muted fw-light">لوحة التحكم /</span> القاعات / تعديل</h4>

        <!-- Basic Layout -->
        <div class="row">
            <div class="col-xl">
                <div class="card mb-12">

                    {{-- <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Basic Layout</h5>
                        <small class="text-muted float-end">Default label</small>
                    </div> --}}

                    <div class="card-body">
                        <form action="{{ route('dashboard.hall.update', $hall->id) }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            @method('PUT')
                            <div class="row">
                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-name">الاسم</label>
                                    <input type="text" name="name"
                                        class="form-control @error('name') is-invalid @enderror" value="{{ old('name', $hall->name) }}" id="basic-default-name"
                                        placeholder="الاسم" />
                                    @error('name')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-email">البريد الالكتروني</label>
                                    <input type="email" name="email" value="{{ old('email', $hall->email) }}"
                                        class="form-control @error('email') is-invalid @enderror" id="basic-default-email"
                                        placeholder="البريد الالكتروني" />
                                    @error('email')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>


                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-longitude">موقع الكتروني</label>
                                    <input type="text" name="url" value="{{ old('url', $hall->url) }}"
                                        class="form-control @error('url') is-invalid @enderror" id="basic-default-longitude"
                                        placeholder="موقع الكتروني" />
                                    @error('url')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>



                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-phone">رقم الهاتق</label>
                                    <input type="number" name="phone" value="{{ old('phone', $hall->phone) }}"
                                        class="form-control @error('phone') is-invalid @enderror" id="basic-default-phone"
                                        placeholder="رقم الهاتق" />
                                    @error('phone')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="col-6 mb-3">
                                    <label for="formFile" class="form-label">تحميل صور القاعة</label>
                                    <input type="file" name="images[]" multiple
                                        class="form-control @error('images') is-invalid @enderror" id="formFile" />
                                    @error('images')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="col-6 mb-3">
                                    <label for="exampleFormControlTextarea1" class="form-label">تفاصيل القاعة</label>
                                    <textarea name="desc" class="form-control @error('desc') is-invalid @enderror" id="exampleFormControlTextarea1" rows="3"> {{ old('desc', $hall->desc) }}</textarea>
                                    @error('desc')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                            </div>

                            <button type="submit" class="btn btn-primary">تعديل القاعة</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

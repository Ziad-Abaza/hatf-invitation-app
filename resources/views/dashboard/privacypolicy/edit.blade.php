@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 mb-4"><span class="text-muted fw-light">لوحة التحكم /</span> سياسة الاستخدام والخصوصية / تعديل</h4>

        <!-- Basic Layout -->
        <div class="row">
            <div class="col-xl">
                <div class="card mb-12">

                    {{-- <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Basic Layout</h5>
                        <small class="text-muted float-end">Default label</small>
                    </div> --}}

                    <div class="card-body">
                        <form action="{{ route('dashboard.privacy.policy.update', $privacyPolicy->id) }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="row">
                                <div class="col-12 mb-3">
                                    <label for="exampleFormControlTextarea1" class="form-label">سياسة الاستخدام والخصوصية</label>
                                    <textarea name="content" class="form-control @error('content') is-invalid @enderror"
                                        id="exampleFormControlTextarea1" rows="15"> {{ old('content', $privacyPolicy->content) }}</textarea>
                                    @error('content')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>

                            <x-button type="submit" >
                               تعديل سياسة الاستخدام والخصوصية                       
                            </x-button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

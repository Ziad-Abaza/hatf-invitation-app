@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 mb-4"><span class="text-muted fw-light">لوحة التحكم /</span> الاعدادات / تعديل</h4>

        <!-- Basic Layout -->
        <div class="row">
            <div class="col-xl">
                <div class="card mb-12">

                    <div class="card-body">
                        <form action="{{ route('dashboard.setting.update', $setting->id) }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            @method('PUT')

                            <div class="row">
                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-instagram">Instagram</label>
                                    <input type="text" name="instagram"
                                        value="{{ old('instagram', $setting->instagram) }}"
                                        class="form-control @error('instagram') is-invalid @enderror"
                                        id="basic-default-instagram" placeholder="instagram" />
                                    @error('instagram')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <x-button type="submit" >
                                تعديل                          
                             </x-button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

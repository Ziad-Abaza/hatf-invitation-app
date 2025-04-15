@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 mb-4"><span class="text-muted fw-light">Admin/</span> Create</h4>

        <!-- Basic Layout -->
        <div class="row">
            <div class="col-xl">
                <div class="card mb-12">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Basic Layout</h5>
                        <small class="text-muted float-end">Default label</small>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('dashboard.admin.update', $admin->id) }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            @method('PUT')

                            <div class="row justify-content-between">
                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-fullname">Full Name</label>
                                    <input type="text" name="name"
                                        class="form-control @error('name') is-invalid @enderror"
                                        value="{{ old('name', $admin->name) }}" id="basic-default-fullname"
                                        placeholder="John Doe" />
                                    @error('name')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-email">Email</label>
                                    <div class="input-group input-group-merge">
                                        <input type="text" name="email" value="{{ old('email', $admin->email) }}"
                                            id="basic-default-email"
                                            class="form-control @error('email') is-invalid @enderror" placeholder="john.doe"
                                            aria-label="john.doe" aria-describedby="basic-default-email2" />
                                        <span class="input-group-text" id="basic-default-email2">@example.com</span>
                                        @error('email')
                                            <div
                                                class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-phone">Phone</label>
                                    <input type="number" name="phone" value="{{ old('phone', $admin->phone) }}"
                                        class="form-control @error('phone') is-invalid @enderror" id="basic-default-phone"
                                        placeholder="Phone." />
                                    @error('phone')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-password">Password</label>
                                    <input type="password" name="password"
                                        class="form-control @error('password') is-invalid @enderror"
                                        id="basic-default-password" placeholder="Phone." />
                                    @error('password')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-address">Address</label>
                                    <input type="text" name="address" value="{{ old('address', $admin->address) }}"
                                        class="form-control @error('address') is-invalid @enderror"
                                        id="basic-default-address" placeholder="Address" />
                                    @error('address')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="col-6 mb-3">
                                    <label for="formFile" class="form-label">Default
                                        file input example</label>
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
                                Update                         
                             </x-button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

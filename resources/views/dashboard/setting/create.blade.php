@extends('dashboard.layout.main')

@section('main')
    <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="py-3 mb-4"><span class="text-muted fw-light">Blog/</span> Create</h4>

        <!-- Basic Layout -->
        <div class="row">
            <div class="col-xl">
                <div class="card mb-12">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Basic Layout</h5>
                        <small class="text-muted float-end">Default label</small>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('dashboard.blog.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <div class="row">
                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-title">Title</label>
                                    <input type="text" name="title"
                                        class="form-control @error('title') is-invalid @enderror" id="basic-default-title"
                                        placeholder="Title" />
                                    @error('title')
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

                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-article_en">Article En</label>
                                    <input type="text" name="article_en"
                                        class="form-control @error('article_en') is-invalid @enderror"
                                        id="basic-default-article_en" placeholder="Article En." />
                                    @error('article_en')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <div class="col-6 mb-3">
                                    <label class="form-label" for="basic-default-article_ar">Article Ar</label>
                                    <input type="text" name="article_ar"
                                        class="form-control @error('article_ar') is-invalid @enderror"
                                        id="basic-default-article_ar" placeholder="Article Ar." />
                                    @error('article_ar')
                                        <div
                                            class="fv-plugins-message-container fv-plugins-message-container--enabled invalid-feedback">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary">Send</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection

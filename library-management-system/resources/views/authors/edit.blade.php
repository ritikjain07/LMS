@extends('layout')

@section('content')
    <h1>Edit Author</h1>

    <form action="{{ route('authors.update', $author->authorId) }}" method="POST">
        @csrf
        @method('PUT')
        <label>Name:</label>
        <input type="text" name="name" value="{{ $author->name }}" required>
        <label>Publisher Name:</label>
        <input type="text" name="publisherName" value="{{ $author->publisherName }}">
        <label>Address:</label>
        <input type="text" name="address" value="{{ $author->address }}">
        <label>Total Copies:</label>
        <input type="number" name="totalCopies" value="{{ $author->totalCopies }}">
        <label>Show:</label>
        <input type="checkbox" name="isShow" value="1" {{ $author->isShow ? 'checked' : '' }}>
        <button type="submit">Update</button>
    </form>
@endsection

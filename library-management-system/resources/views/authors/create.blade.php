@extends('layout')

@section('content')
    <h1>Add Author</h1>

    <form action="{{ route('authors.store') }}" method="POST">
        @csrf
        <label>Name:</label>
        <input type="text" name="name" required>
        <label>Publisher Name:</label>
        <input type="text" name="publisherName">
        <label>Address:</label>
        <input type="text" name="address">
        <label>Total Copies:</label>
        <input type="number" name="totalCopies">
        <label>Show:</label>
        <input type="checkbox" name="isShow" value="1" checked>
        <button type="submit">Save</button>
    </form>
@endsection

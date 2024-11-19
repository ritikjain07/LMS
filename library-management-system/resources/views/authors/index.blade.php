@extends('layout')

@section('content')
    <h1>Authors</h1>
    <a href="{{ route('authors.create') }}">Add Author</a>

    @if(session('success'))
        <p>{{ session('success') }}</p>
    @endif

    @if(session('error'))
        <p>{{ session('error') }}</p>
    @endif

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Publisher Name</th>
                <th>Address</th>
                <th>Total Copies</th>
                <th>Show</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            @foreach($authors as $author)
                <tr>
                    <td>{{ $author->name }}</td>
                    <td>{{ $author->publisherName }}</td>
                    <td>{{ $author->address }}</td>
                    <td>{{ $author->totalCopies }}</td>
                    <td>{{ $author->isShow ? 'Yes' : 'No' }}</td>
                    <td>
                        <a href="{{ route('authors.edit', $author->authorId) }}">Edit</a>
                        <form action="{{ route('authors.destroy', $author->authorId) }}" method="POST" style="display:inline;">
                            @csrf
                            @method('DELETE')
                            <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endsection

<?php

namespace App\Http\Controllers;

use App\Models\Author;
use Illuminate\Http\Request;

class AuthorController extends Controller
{
    public function index()
    {
        $authors = Author::all();
        return view('authors.index', compact('authors'));
    }

    public function create()
    {
        return view('authors.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|max:255',
        ]);

        Author::create($request->all());
        return redirect()->route('authors.index')->with('success', 'Author created successfully.');
    }

    public function edit($authorId)
    {
        $author = Author::findOrFail($authorId);
        return view('authors.edit', compact('author'));
    }

    public function update(Request $request, $authorId)
    {
        $request->validate([
            'name' => 'required|max:255',
        ]);

        $author = Author::findOrFail($authorId);
        $author->update($request->all());
        return redirect()->route('authors.index')->with('success', 'Author updated successfully.');
    }

    public function destroy($authorId)
    {
        $author = Author::findOrFail($authorId);

        if (method_exists($author, 'books') && $author->books()->count() > 0) {
            return redirect()->route('authors.index')->with('error', 'Cannot delete author as they are associated with books.');
        }

        $author->delete();
        return redirect()->route('authors.index')->with('success', 'Author deleted successfully.');
    }
}

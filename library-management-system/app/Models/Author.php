<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Author extends Model
{
    use HasFactory;

    protected $table = 'authors';
    protected $primaryKey = 'authorId';
    public $timestamps = false;

    protected $fillable = [
        'name',
        'publisherName',
        'address',
        'totalCopies',
        'isShow',
    ];

    public function books()
    {
        return $this->hasMany(Book::class, 'authorId', 'authorId');
    }
}

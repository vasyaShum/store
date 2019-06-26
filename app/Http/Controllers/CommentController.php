<?php

namespace App\Http\Controllers;

use App\Comment;
use Illuminate\Http\Request;
use Auth;

class CommentController extends Controller
{
    public function addComment($id, Request $request) {
        $comment = new Comment();
        $comment->product_id = $id;
        $comment->user_id = Auth:: user()->id;
        $comment->name = Auth:: user()->name;
        $comment->text = $request->text;
        $comment->save();

        return redirect()->route('products.show',$id)
            ->with('success','Ваш коментар успішно додано');
    }

    public function deleteComment($comment_id,$product_id) {
        Comment::find($comment_id)->delete();
        return redirect()->route('products.show',$product_id)
            ->with('success','Коментар успішно видалено');
    }

}

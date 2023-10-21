class Public::CommentsController < ApplicationController

def update
    @review = Review.find(params[:genre_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
end


end

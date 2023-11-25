class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.all
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:review_id])
    @user = User.all
  end

def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to admin_reviews_path
    else
      render :edit
    end
end

def destroy
    @review = Review.find(params[:review_id])
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to admin_item_review_comments_path(@review.item,@review.id)
end

private

  def comment_params
    params.permit(:content, :review_id, :item_id)
  end


end

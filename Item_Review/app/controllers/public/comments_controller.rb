class Public::CommentsController < ApplicationController

  def index
    @comments = Comment.all
    @item = Item.find(params[:item_id])
    @review = Review.find(params[:review_id])
    @user = User.all
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.review_id = @review.id
    @comment.save
  end

  private

  def comment_params
    params.permit(:content, :review_id, :item_id)
  end

end

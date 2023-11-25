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
    if @comment.save
      redirect_to item_review_comments_path(@review.item,@review.id)
    else
      flash[:error] = "コメントに必要な情報が記載されていません"
      redirect_to request.referer
    end
  end

  private

  def comment_params
    params.permit(:content, :review_id, :item_id)
  end

end

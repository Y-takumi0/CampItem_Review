class Public::CommentsController < ApplicationController

  def index
    @review = Review
  end

  def create
    review = Review.find(params[:review])
    comment = current_user.comments.new(comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to item_review_comments_path(review)
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :review_id)  #formにてpost_idパラメータを送信して、コメントへpost_idを格納するようにする必要がある。
  end

end

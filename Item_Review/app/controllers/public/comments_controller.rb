class Public::CommentsController < ApplicationController

def create
    review = Review.find(params[:review_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.review_id = review.id
    comment.save
    redirect_to item_reviews_path(review)
end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end

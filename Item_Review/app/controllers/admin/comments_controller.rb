class Admin::CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to admin_reviews_path
    else
      render :edit
    end
end

private

  def comment_params
    params.require(:comment).permit(:display_status)
  end

end

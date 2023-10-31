class Admin::ReviewsController < ApplicationController
def index
end


def create
  @review = Review.new(review_params)
  @review.user_id = current_user.id
  if @review.save
    redirect_to  reviews_path(@review.Item)
  else
    @Item = Item.find(params[:Item_id])
  end
end

  private

  def review_params
    params.require(:review).permit(:item_id, :article, :star, :display_status)
  end

end

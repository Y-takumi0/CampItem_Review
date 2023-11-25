class Public::ReviewsController < ApplicationController
before_action :authenticate_user!, only: [:create]

def index
  @item = Item.find(params[:item_id])
  @reviews = @item.reviews
  @user = User.all
end

def create
  @review = Review.new(review_params)
  @review.user_id = current_user.id
  if @review.save
    redirect_to  item_reviews_path(@review.item_id)
  else
    flash[:error] = "レビューに必要な情報が記載されていません"
    redirect_to request.referer
  end
end


  private

 def review_params
    params.require(:review).permit(:item_id, :star, :article)
 end

end

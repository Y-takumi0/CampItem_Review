class Admin::ReviewsController < ApplicationController
def index
  @item = Item.find(params[:item_id])
  @reviews = @item.reviews
end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to admin_item_reviews_path(@review), notice: "レビューの表示を更新しました。"
    else
      render :index
    end
  end

  private

  def review_params
    params.require(:review).permit(:item_id, :article, :star, :display_status)
  end

end

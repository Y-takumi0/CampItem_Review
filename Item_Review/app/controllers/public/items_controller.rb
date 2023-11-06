class Public::ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def new
    @item = Item.new
  end

    def index
      if params[:category_id].present?
         @category = Category.find(params[:category_id])
         @items = @category.items
      else
        @items = Item.all
      end
    end

  def show
    @item = Item.find(params[:id])
    @review = Review.new
    @comment = Comment.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
      flash[:notice] = "新たにアイテムを追加しました。"
    else
      render :new
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
      flash[:notice] = "アイテム情報を更新しました。"
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :on_sale, :image, :star, category_ids:[])
  end

end

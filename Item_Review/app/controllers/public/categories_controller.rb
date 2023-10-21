class Public::CategoriesController < ApplicationController
before_action :set_category, only: [:edit, :update]

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Genre.new(genre_params)
    if @category.save
      redirect_to categorys_path
      @categories = Category.all
      render :index
    end
  end

  def update
    if @category.update(genre_params)
      redirect_to categorys_path
    else
      render :edit
    end
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
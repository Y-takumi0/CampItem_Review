class Item < ApplicationRecord
  has_one_attached :image
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy

  def self.looks(search, word)
    if search == "perfect_match"
      @item = Item.where("name LIKE?", "#{word}")
    elsif search == "partial_match"
      @item = Item.where("name LIKE?","%#{word}%")
    else
      @item = Item.all
    end
  end
end
class Item < ApplicationRecord
  has_one_attached :image
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
end
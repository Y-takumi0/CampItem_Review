class Item < ApplicationRecord
has_one_attached :image
has_many :categorys
belongs_to :category

end

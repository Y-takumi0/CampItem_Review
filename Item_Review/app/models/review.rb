class Review < ApplicationRecord
belongs_to :user
belongs_to :item
has_many :comments, dependent: :destroy
end

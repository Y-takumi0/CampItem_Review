class Review < ApplicationRecord
belongs_to :user
belongs_to :item
has_many :comments, dependent: :destroy
validates :star, :article, presence: true
end

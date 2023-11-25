class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  belongs_to :item
  validates :content, presence: true
end

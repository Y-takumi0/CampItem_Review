class Review < ApplicationRecord
belongs_to :user
belongs_to :item
has_many :comments, dependent: :destroy

  def guest_user?
    email == GUEST_USER_EMAIL
  end
end

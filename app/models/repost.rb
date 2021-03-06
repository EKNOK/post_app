class Repost < ApplicationRecord

  validates :content, presence: true, length:{maximum: 16}
  validates :user_id, presence: true
  validates :post_id, presence: true

  belongs_to :user
  belongs_to :post
  has_many :comments, dependent: :destroy

end

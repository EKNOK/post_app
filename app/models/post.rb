class Post < ApplicationRecord
  belongs_to :user
  has_many :reposts, dependent: :destroy

  validates :title, presence: true, length:{maximum: 20}
  validates :content, presence: true, length:{maximum: 255}
  validates :user_id, presence: true


# postについているrepostの数(index) 必要？
  def repost_count
    reposts.count
  end



end

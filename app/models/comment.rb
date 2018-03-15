class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :repost

  validates :content, presence: true, length: {maximum: 12}
  validates :user_id, presence: true
  validates :repost_id, presence: true

  
  def comment_count
    comments.count
  end
end

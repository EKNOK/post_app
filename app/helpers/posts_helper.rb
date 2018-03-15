module PostsHelper

  # 各repostのcommentsの取得
  def repost_to_comments(repost_id)
    comments = Comment.where(repost_id: repost_id)
    comments
  end

end

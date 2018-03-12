class RePostsController < ApplicationController
  before_action :authenticate_user!
  before_action :re_post_correct_user, only:[:destroy]

  def index
    @re_posts = Re_post.all
  end

  def new
    @re_post = Re_post.new
  end

  def create
    @re_post = current_user.posts.reposts
  end

  def destroy
  end

  private

  def re_posts_params

  end

  def re_post_correct_user
  end

end

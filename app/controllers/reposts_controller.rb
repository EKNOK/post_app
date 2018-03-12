class RepostsController < ApplicationController
  def index
    @reposts = Repost.all
  end

  def new
    @repost = Repost.new
  end

  def create
    @repost = current_user.post
  end


  private

  def repost_connect_user

  end

  def post
    @post = Post.find_by(id: params[:id])
  end
end

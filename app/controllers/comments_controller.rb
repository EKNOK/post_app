class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :comment_connect_user, only:[:destroy]


  def create
    @comment = current_user.comments.build(comment_params)
    repost = Repost.find(params[:comment][:repost_id])
    if @comment.save
      redirect_to post_path(repost.post_id)
    else
      flash[:danger] = "Comment Missing !"
      redirect_back(fallback_location: post_path(repost.post_id))
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "comment destory !"
    redirect_back(fallback_location: post_path)
  end

  def index
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :repost_id)
  end

  def comment_connect_user
    @comment = current_user.comments.find_by(id: params[:id])
    if @comment.nil?
      flash[:danger] = "Have no autherity to This Comment ! try again !"
      redirect_back(fallback_location: post_path)
    end
  end

end

class RepostsController < ApplicationController
  before_action :repost_connect_user, only:[:destroy]

  def index
    @reposts = Repost.all
  end


  def create
    @repost = current_user.reposts.build(repost_params)
    if @repost.save
      redirect_to post_path(@repost.post.id)
    else
      flash[:danger] = " Reply Missing"
      redirect_to post_path(@repost.post.id)
    end
  end

  def destroy
    @post = @repost.post
    @repost.destroy
    redirect_to @post
  end


  private

  def repost_params
    params.require(:repost).permit(:content, :post_id)
  end

  def repost_connect_user
    @repost = current_user.reposts.find_by(id: params[:id])
    if @repost.nil?
      flash[:danger] = "Have no authority to This RePost"
      redirect_to root_url
    end
  end

end

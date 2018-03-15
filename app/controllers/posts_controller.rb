class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :post_correct_user, only: [:destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @reposts = @post.reposts.where(post_id: params[:id])
    @repost = @post.reposts.build
    @comment = current_user.comments.build
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Create Post! Lets try to #{@post.title}"
      redirect_to @post
    else
      flash[:danger] = "Try again !"
      render @post
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post Destroy !"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def post_correct_user
    @post = current_user.posts.find_by(id: params[:id])
    if @post.nil?
      flash[:danger] = "Have no authority to This Post"
      redirect_to root_url
    end
  end


end

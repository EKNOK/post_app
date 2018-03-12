class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_name_params)
      flash[:success] = "your name chenge ! Hello #{@user.name}"
      redirect_to @user
    else
      flash[:danger] = "your name dont cahnge! Try again!"
      render @user
    end
  end

  def show
    @user = current_user

  end

  private

  def user_name_params
    params.require(:user).permit(:name)
  end
end

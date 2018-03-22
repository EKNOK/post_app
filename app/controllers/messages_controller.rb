class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:success] = "Thank You for message !!"
      redirect_to messages_path
    else
      flash[:danger] = "Try Again.. "
      @messages = Message.all
      render 'messages/index'
    end
  end

  def destroy
    @message = Message.find_by(id: params[:id])
    @message.destroy
    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:name, :content)
  end

end

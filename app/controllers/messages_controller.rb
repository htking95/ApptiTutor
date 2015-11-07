class MessagesController < ApplicationController
  before_action :authenticate_userlogin!

  def new
  end

  def create
    recipients = Userlogin.where(id: params['recipients'])
    conversation = current_userlogin.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end
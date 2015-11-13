class ConversationsController < ApplicationController
  before_action :authenticate_userlogin!

  def new
  end

def create
    recipients = Userlogin.where(id: conversation_params[:recipients])
    conversation = current_userlogin.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Your message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def show
    @receipts = conversation.receipts_for(current_userlogin)
    # mark conversation as read
    conversation.mark_as_read(current_user)
  end

  def reply
    current_userlogin.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
    redirect_to conversation_path(conversation)
  end

  def trash
    conversation.move_to_trash(current_userlogin)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_userlogin)
    redirect_to mailbox_inbox_path
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end

end
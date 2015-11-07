class ConversationsController < ApplicationController
  before_action :authenticate_userlogin!
  before_action :get_mailbox
  before_action :get_conversation, except: [:index]

  def index
    @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  private

  def get_conversation
    @conversation ||= @mailbox.conversations.find_by_id(params[:id])
  end

  def get_mailbox
    @mailbox ||= current_userlogin.mailbox
    puts @mailbox.conversations.find_by_id(params[:id])
  end
end
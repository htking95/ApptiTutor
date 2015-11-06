class HelpsController < ApplicationController
  def new
    @helpmessage = Help.new
  end

  def create
    @helpmessage = Help.new(message_params)
    
    if @helpmessage.valid?
      HelpMailer.new_message(@helpmessage).deliver
      redirect_to contact_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

private

  def message_params
    params.require(:help).permit(:subject, :content)
  end

end

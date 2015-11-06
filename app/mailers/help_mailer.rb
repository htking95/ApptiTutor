class HelpMailer < ApplicationMailer

	default from: "Your Mailer <noreply@yourdomain.com>"
  	default to: "Your Name <your.email@yourdomain.com>"

  def new_message(helpmessage)
    @helpmessage = helpmessage
    
    mail subject: "Message from #{helpmessage.subject}"
  end
end

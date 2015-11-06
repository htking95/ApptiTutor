class UserMailer < ApplicationMailer
	default from: "Your Mailer <noreply@yourdomain.com>"
	default to: "Your Name <your.email@yourdomain.com>"

	def message_to_devs(message)
		@message = message

		mail subject: "#{message.subject}"
	end

	def welcome_email(user)
		@user = user
		@url = 'http://example.com/login'
		mail(from: "ApptiTutor", to: @user.email, subject: 'Welcome to ApptiTutor!')
	end
end

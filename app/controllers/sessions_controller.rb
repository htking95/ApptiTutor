# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController
	def disable_foot
		@disable_foot = true
	end
end
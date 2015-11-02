# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
	def index
    	@userlogin = Userlogin.all
  	end

	def new
		super
	end

	def create
		# add logic here...
		# do I even need a new controller? There is a way to link reviews to
		# users so maybe i link a profile in a similar way? or do I just add 
		# more fields to the devise page? If I do that, I will have to find a
		# way to search via devise, but I have struck out so far with that.
		# I haven't found a solution to adding to the user database via the 
		# devise new registation page though :(
	end

	def update
		super
	end
end

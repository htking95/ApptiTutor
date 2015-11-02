class UsersController < ApplicationController
	def index
    	@userlogins = Userlogin.all
  	end
  	
  	def show
  	end
end
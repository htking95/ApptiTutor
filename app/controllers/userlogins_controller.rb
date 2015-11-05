class UsersController < ApplicationController
	def index
    	@userlogins = Userlogin.all
  	end
  	
  	def show
  		@userlogins = Userlogin.find(params[:id])
  	end
end
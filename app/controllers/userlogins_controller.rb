# app/controllers/userlogins_controller.rb
class UserloginsController < ApplicationController
	def index
    	@userlogins = Userlogin.all
  	end

  	def show
  		@userlogins = Userlogin.find(params[:id])
  		super
  	end

  	def search
  		if params[:search].present?
  			@userlogins = Userlogin.search(params[:search])
  		else
  			@userlogins = Userlogin.all
  		end
  	end

	def new
		super
	end

	def create
		super
	end

	def update
		super
	end
end

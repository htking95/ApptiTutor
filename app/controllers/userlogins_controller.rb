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
  		if params[:search].present? || params[:price].present?
  			@userlogins = Userlogin.search params[:search], fields:[{aboutMe: :word_start}, {email: :word_start}, {classes: :word_start}, {skills: :word_start}]
        @userlogins = Userlogin.where("price <= ?", params["price"]) if params[:price].present?
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

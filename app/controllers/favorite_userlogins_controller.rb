class FavoriteUserloginsController < ApplicationController
  before_action :set_userlogin

  def create
    puts @userlogin_id.to_s
    tmp = "/pages/User_Profile/" 
    tmp << params[:userlogin_id]
    if Favorite.create(favorited: @userlogin, userlogin: current_userlogin)
      redirect_to tmp, notice: 'Tutor has been favorited'
    else
      redirect_to tmp, alert: 'Something went wrong...*sad panda*'
    end
  end
  
  def destroy
    tmp = "/pages/User_Profile/" 
    tmp << params[:id]
    Favorite.where(favorited_id: @userlogin.id, userlogin_id: current_userlogin).first.destroy
    redirect_to tmp, notice: 'Tutor is no longer in favorites'
  end
  
  private
  
  def set_userlogin
    @userlogin = Userlogin.find(params[:userlogin_id] || params[:id])
  end
end
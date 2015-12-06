class PagesController < ApplicationController
  def Search
  end

  def Messaging
  end

  def Favorites
  end

  def Error
  end

  def Profile_Setup
  end

  def User_Profile
      @userprofile = Userlogin.find(params[:id])
      @rev = Rate.where(rateable_id: params[:id]).select("review")      
      @userreviews = @userprofile.userreviews.all
      @userreview = @userprofile.userreviews.build
  end

  def disable_nav
    @disable_nav = true
  end

  def disable_foot
    @disable_foot = true
  end

  def redTo404
    redirect_to '/pages/Error'
  end
  helper_method :redTo404
  
end

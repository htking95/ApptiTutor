class RaterController < ApplicationController

  def create
    if userlogin_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_userlogin, params[:dimension]

      render :json => true
    else
      render :json => false
    end
  end
end

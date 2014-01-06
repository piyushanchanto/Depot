class SessionsController < ApplicationController
  skip_before_filter :authorize
  
  def new
  end

  def create
    
    user = User.find_by_name(params[:name])
    if user 
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid username or password"
    end
  end

  # def create
  #   user = User.from_omniauth(env["omniauth.auth"])
  #   session[:user_id] = user.id
  #   redirect_to root_url
  # end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, :notice => "Logged Out"
  end
end

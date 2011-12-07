class SessionsController < ApplicationController
  before_filter :current_user
  def create
    auth_hash = request.env["omniauth.auth"]
    
    if session[:user_id]
      User.find(session[:user_id]).add_provider(auth_hash)
      
      redirect_to index_path, :controller => :movies, :flash => { :notice => "You can now login using #{auth_hash["provider"].capitalize} too!"}
    else
      auth = Authorization.find_or_create(auth_hash)
      session[:user_id] = auth.user.id
      redirect_to index_path, :controller => :movies, :flash => { :notice => "Welcome, #{auth.user.name}!"}
      
      
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, :flash => { :notice => "You have signed out." }
  end

  def failure
    redirect_to root_path, :flash => { :failure => "Sorry, something wrong happend, please try again." }
  end

end

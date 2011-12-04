class SessionsController < ApplicationController
  def create
    auth_hash = request.env["omniauth.auth"]
    
    @authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
    if @authorization
      redirect_to index_path, :controller => :movies, :flash => { :notice => "Welcome back, #{@authorization.user.name}!" }
    else
      user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
      user.authorizations.build :provider => auth_hash["provider"], :uid => auth_hash["uid"], :uname => auth_hash["info"]["name"]
      user.save
      
      redirect_to index_path, :controller => :movies, :flash => { :notice => "Hi #{user.name}! You're signed up." }
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

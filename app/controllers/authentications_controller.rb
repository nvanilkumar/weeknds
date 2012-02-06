class AuthenticationsController < ApplicationController
   def index
    @authentications = current_usersecure.authentications if current_usersecure
  end
  
  def create
    flash[:notice] = "Signed in from create."
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully authenticatio."
      sign_in_and_redirect(:usersecure, authentication.usersecure)
    elsif current_usersecure
      current_usersecure.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      usersecure = Usersecure.new
      usersecure.apply_omniauth(omniauth)
      if usersecure.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:usersecure, usersecure)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_usersecure_registration_url
      end
    end
  end
   
  
  def destroy
    @authentication = current_usersecure.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end

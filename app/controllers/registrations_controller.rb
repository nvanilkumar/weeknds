class RegistrationsController < Devise::RegistrationsController
  def create
    super
    session[:omniauth] = nil unless @usersecure.new_record?
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @usersecure.apply_omniauth(session[:omniauth])
      @usersecure.valid?
    end
  end
end

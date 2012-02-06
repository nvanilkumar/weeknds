class UserMailer < ActionMailer::Base
  default from: "52wknds@gmail.com"
  
  def registration_confirmation(usersecure)
    @usersecure = usersecure
   # attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
    mail(:to => "#{@usersecure.firstname} ", :subject => "Registered")
  end
end

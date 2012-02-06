class Usersecure < ActiveRecord::Base
  has_many :authentications
  has_many :groups
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  def apply_omniauth(omniauth)
    self.email = omniauth['info']['email'] if email.blank?
    self.firstname = omniauth['info']['first_name']
    self.lastname = omniauth['info']['last_name']
    self.photourl = omniauth['info']['image']
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
   def self.create_with_omniauth(omniauth)  
    create! do |usersecure|
      usersecure.firstname = omniauth['info']['first_name']
      usersecure.lastname = omniauth['info']['last_name']
      usersecure.photourl = 'images'
    end
  end
  def password_required?
    (authentications.empty? || !password.blank?) && super
  end
end

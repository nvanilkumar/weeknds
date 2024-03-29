class Authentication < ActiveRecord::Base
  belongs_to :usersecure
  def provider_name
    if provider == 'open_id'
      "OpenID"
    else
      provider.titleize
    end
  end
end

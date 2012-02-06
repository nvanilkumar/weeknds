class User < ActiveRecord::Base
  def self.find_by_userid(userid)
    find_by_sql("select * from users where id = ?", userid)
  end
end

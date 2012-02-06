class Group < ActiveRecord::Base
  belongs_to :invites
  belongs_to :usersecures
  attr_accessible :usersecure_id, :title, :startdate, :enddate, :password_digest, :grouptype, :experience_id, :payment_id, :description, :form_id, :time, :isactive, :isvalid,  :invitationurl, :created_at, :updated_at,:numberofseats
  def self.find_by_first_letter(pid)
      find_by_sql [ "select * from groups where experience_id = ?", pid]
   end
   def self.find_by_experience(pid)
     find_by_sql ["select * from experiences where experience_id = ?", pid]
   end
   
end

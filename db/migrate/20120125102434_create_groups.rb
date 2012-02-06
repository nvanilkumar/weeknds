class CreateGroups < ActiveRecord::Migration
  def change
   create_table :groups do |t|
      t.string :title, :null => false, :limit => 15
      t.integer :user_id, :null => false
      t.date :startdate, :null => false
      t.date :enddate, :null => false
      t.string :password_digest, :null => true
      t.string :grouptype, :null => false
      t.integer :experience_id
      t.integer :payment_id
      t.text :description
      t.integer :form_id
      t.time :time, :null => false
      t.integer :isactive, :limit => 1, :default => 1
      t.integer :isvalid, :limit => 1, :default => 0
      t.string  :invitationurl, :default => 1
      t.column :created_at, :timestamp
      t.column :updated_at, :timestamp
    end
  end
end

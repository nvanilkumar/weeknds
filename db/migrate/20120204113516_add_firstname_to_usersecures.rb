class AddFirstnameToUsersecures < ActiveRecord::Migration
  def change
    add_column :usersecures, :firstname, :string, :default => 'user'
    add_column :usersecures, :lastname, :string
    add_column :usersecures, :mobile, :integer
    add_column :usersecures, :photourl, :string, :default => 'userimg.jpg'
    add_column :usersecures, :usertype, :integer, :default => 1, :limit => 1
  end
end

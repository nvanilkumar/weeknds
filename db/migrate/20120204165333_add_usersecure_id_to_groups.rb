class AddUsersecureIdToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :usersecure_id, :integer

  end
end

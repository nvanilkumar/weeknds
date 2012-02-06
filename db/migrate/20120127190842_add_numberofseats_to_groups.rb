class AddNumberofseatsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :numberofseats, :integer
  end
end

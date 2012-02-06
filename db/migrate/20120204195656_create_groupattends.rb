class CreateGroupattends < ActiveRecord::Migration
  def change
    create_table :groupattends do |t|
      t.integer :group_id, :null => false
      t.integer :usersecure_id
      t.integer :numofinstallments, :default => 0
      t.integer :paymentstatus, :default => 0

      t.timestamps
    end
  end
end

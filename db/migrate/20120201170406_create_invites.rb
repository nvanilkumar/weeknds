class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :group_id
      t.string :email
      t.integer :status

      t.timestamps
    end
  end
end

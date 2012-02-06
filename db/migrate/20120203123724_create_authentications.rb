class CreateAuthentications < ActiveRecord::Migration
  def self.up
    create_table :authentications do |t|
      t.integer :usersecure_id
      t.string :provider
      t.string :fuserid
      t.timestamps
    end
  end

  def self.down
    drop_table :authentications
  end
end

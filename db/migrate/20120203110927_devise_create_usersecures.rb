class DeviseCreateUsersecures < ActiveRecord::Migration
  def self.up
    create_table(:usersecures) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.integer :user_id 
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both

      t.timestamps
    end

    add_index :usersecures, :email,                :unique => true
    add_index :usersecures, :reset_password_token, :unique => true
    # add_index :usersecures, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :usersecures
  end
end

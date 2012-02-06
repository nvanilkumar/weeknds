class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname, :default => 'user'
      t.string :lastname
      t.string :email
      t.string :password_digest, :null => true
      t.integer :phone
      t.integer :mobile
      t.integer :isFBUser, :limit => 1, :default => 0
      t.integer :isGroupOrganiser, :limit => 1, :default => 0
      t.string :photourl
      t.timestamps
    end
  end
end

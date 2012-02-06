class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :title, :null => false
      t.text :description
      t.string :photourl
      t.integer :isactive, :limit => 1, :default => 1
      t.float :defaultprice, :default => 0.0
      t.integer :minimumseats, :default => 5
      t.timestamps
    end
  end
end


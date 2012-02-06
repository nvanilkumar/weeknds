class CreateConstants < ActiveRecord::Migration
  def change
    create_table :constants do |t|
      t.string :title
      t.string :value
      t.string :description
      t.timestamps
    end
  end
end

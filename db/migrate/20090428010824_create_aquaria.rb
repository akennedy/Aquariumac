class CreateAquaria < ActiveRecord::Migration
  def self.up
    create_table :aquaria do |t|
      t.integer :user_id
      t.string :name
      t.integer :size
      t.timestamps
    end
  end
  
  def self.down
    drop_table :aquaria
  end
end

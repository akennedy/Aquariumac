class CreateFishes < ActiveRecord::Migration
  def self.up
    create_table :fishes do |t|
      t.integer :user_id
      t.integer :aquarium_id
      t.string :scientific_name
      t.string :common_name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :fishes
  end
end

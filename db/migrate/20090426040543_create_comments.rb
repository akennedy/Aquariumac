class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :post_id
      t.string :email
      t.text :body
      t.boolean :approved
      t.timestamps
      t.integer :user_id
    end
  end
  
  def self.down
    drop_table :comments
  end
end

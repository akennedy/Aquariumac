class AddAttachmentsImageToFishy < ActiveRecord::Migration
  def self.up
    add_column :fishes, :image_file_name, :string
    add_column :fishes, :image_content_type, :string
    add_column :fishes, :image_file_size, :integer
    add_column :fishes, :image_updated_at, :datetime
  end

  def self.down
    remove_column :fishes, :image_file_name
    remove_column :fishes, :image_content_type
    remove_column :fishes, :image_file_size
    remove_column :fishes, :image_updated_at
  end
end

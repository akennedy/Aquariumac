class AlterFishesTbl < ActiveRecord::Migration
    def self.up
      add_column :fishes, :genus_name, :string
      add_column :fishes, :species_name, :string
      add_column :fishes, :water_type, :string
      remove_column :fishes, :scientific_name
    end

    def self.down
      remove_column :fishes, :genus_name
      remove_column :fishes, :species_name
      remove_column :fishes, :water_type
      add_column :fishes, :scientific_name
    end
  end


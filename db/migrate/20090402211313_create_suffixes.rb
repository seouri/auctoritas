class CreateSuffixes < ActiveRecord::Migration
  def self.up
    create_table :suffixes do |t|
      t.string :name
    end
    add_index :suffixes, :name
  end

  def self.down
    drop_table :suffixes
  end
end

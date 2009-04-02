class CreateSuffixes < ActiveRecord::Migration
  def self.up
    create_table :suffixes do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :suffixes
  end
end

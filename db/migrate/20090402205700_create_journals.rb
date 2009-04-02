class CreateJournals < ActiveRecord::Migration
  def self.up
    create_table :journals do |t|
      t.string :name
      t.string :abbreviation
      t.string :issn
      t.string :essn
      t.integer :articles_count, :default => 0
    end
    add_index :journals, :name
    add_index :journals, :abbreviation
    add_index :journals, :issn
    add_index :journals, :essn
  end

  def self.down
    drop_table :journals
  end
end

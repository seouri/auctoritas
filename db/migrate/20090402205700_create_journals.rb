class CreateJournals < ActiveRecord::Migration
  def self.up
    create_table :journals do |t|
      t.string :name
      t.string :abbreviation
      t.integer :articles_count, :default => 0
    end
    add_index :journals, [:name, :abbreviation], :unique => true
  end

  def self.down
    remove_index :journals, :column => [:name, :abbreviation]
    drop_table :journals
  end
end

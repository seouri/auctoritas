class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :lastname
      t.string :forename
      t.string :initial
      t.string :suffix
      t.integer :articles_count, :default => 0
      t.timestamps
    end
    add_index :authors, [:lastname, :forename]
    add_index :authors, [:lastname, :initial]
  end

  def self.down
    drop_table :authors
  end
end

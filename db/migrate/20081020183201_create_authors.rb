class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.integer :lastname_id
      t.integer :forename_id
      t.integer :initial_id
      t.integer :suffix_id
      t.integer :articles_count, :default => 0
      t.timestamps
    end
    add_index :authors, [:lastname_id, :forename_id]
    add_index :authors, [:lastname_id, :initial_id]
  end

  def self.down
    drop_table :authors
  end
end

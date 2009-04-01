class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :last_name
      t.string :fore_name
      t.string :initials
      t.string :suffix
      t.integer :articles_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :authors
  end
end

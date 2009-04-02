class CreateAuthorships < ActiveRecord::Migration
  def self.up
    create_table :authorships do |t|
      t.integer :article_id
      t.integer :author_id
      t.integer :position
      t.integer :lastname_id
      t.integer :forename_id
      t.integer :initial_id
      t.integer :suffix_id
      t.string :email
      t.string :affiliation
      t.boolean :verified, :default => false
      t.integer :updated_by
      t.timestamps
    end
    add_index :authorships, :article_id
    add_index :authorships, :author_id
  end

  def self.down
    drop_table :authorships
  end
end

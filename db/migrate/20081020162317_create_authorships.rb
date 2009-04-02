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
      t.integer :verifier_id, :default => 0
      t.timestamps
    end
    add_index :authorships, :article_id
    add_index :authorships, :author_id
    add_index :authorships, :verifier_id
    add_index :authorships, [:lastname_id, :forename_id]
    add_index :authorships, [:lastname_id, :initial_id]
  end

  def self.down
    remove_index :authorships, :las
    drop_table :authorships
  end
end

class CreateAuthorships < ActiveRecord::Migration
  def self.up
    create_table :authorships do |t|
      t.integer :article_id
      t.integer :author_id
      t.integer :position
      t.string :lastname
      t.string :forename
      t.string :initials
      t.string :suffix
      t.string :email
      t.string :affiliation
      t.boolean :verified, :default => false
      t.integer :verifier_id, :default => 0
      t.timestamps
    end
    add_index :authorships, :article_id
    add_index :authorships, :author_id
    add_index :authorships, :verifier_id
    add_index :authorships, [:lastname, :forename]
    add_index :authorships, [:lastname, :initials]
  end

  def self.down
    drop_table :authorships
  end
end

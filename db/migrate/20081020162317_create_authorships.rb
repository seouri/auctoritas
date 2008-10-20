class CreateAuthorships < ActiveRecord::Migration
  def self.up
    create_table :authorships do |t|
      t.integer :article_id
      t.integer :author_id
      t.integer :position
      t.string :last_name
      t.string :fore_name
      t.string :initials
      t.string :suffix
      t.timestamps
    end
    add_index :authorships, :article_id
  end

  def self.down
    drop_table :authorships
  end
end

class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :journal_id
      t.integer :year
      t.string :volume
      t.string :issue
      t.string :pages
      t.text :title
      t.string :doi
      t.integer :authorships_count
      t.integer :verified_authorships_count
      t.timestamps
    end
    add_index :articles, :doi
  end

  def self.down
    remove_index :articles, :doi
    drop_table :articles
  end
end

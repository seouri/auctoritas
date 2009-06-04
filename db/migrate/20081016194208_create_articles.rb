class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :source
      t.string :source_id
      t.integer :journal_id
      t.integer :year
      t.string :volume
      t.string :issue
      t.string :pages
      t.text :title
      t.string :doi
      t.integer :authorships_count, :default => 0
      t.integer :verified_authorships_count, :default => 0
      t.timestamps
    end
    add_index :articles, :journal_id
    add_index :articles, :doi
    add_index :articles, [:source, :source_id], :unique => true
  end

  def self.down
    drop_table :articles
  end
end

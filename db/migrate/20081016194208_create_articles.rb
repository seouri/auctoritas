class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :journal
      t.integer :year
      t.string :volume
      t.string :issue
      t.string :pages
      t.text :title
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end

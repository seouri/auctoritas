class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :journal
      t.integer :year
      t.string :volume
      t.string :issue
      t.string :pagination
      t.text :title
    end
  end

  def self.down
    drop_table :articles
  end
end

class CreateCoauthorships < ActiveRecord::Migration
  def self.up
    create_table :coauthorships do |t|
      t.integer :author_id
      t.integer :coauthor_id
      t.integer :articles_count
    end
    add_index :coauthorships, :author_id
  end

  def self.down
    drop_table :coauthorships
  end
end

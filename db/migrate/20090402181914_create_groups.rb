class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :owner_id
      t.string :name
      t.text :description
      t.timestamps
    end
    add_index :groups, :owner_id
  end

  def self.down
    remove_index :groups, :owner_id
    drop_table :groups
  end
end

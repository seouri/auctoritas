class CreateLastnames < ActiveRecord::Migration
  def self.up
    create_table :lastnames do |t|
      t.string :name
    end
    add_index :lastnames, :name
  end

  def self.down
    drop_table :lastnames
  end
end

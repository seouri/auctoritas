class CreateForenames < ActiveRecord::Migration
  def self.up
    create_table :forenames do |t|
      t.string :name
    end
    add_index :forenames, :name
  end

  def self.down
    drop_table :forenames
  end
end

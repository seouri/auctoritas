class CreateLastnames < ActiveRecord::Migration
  def self.up
    create_table :lastnames do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :lastnames
  end
end

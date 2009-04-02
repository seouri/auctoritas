class CreateInitials < ActiveRecord::Migration
  def self.up
    create_table :initials do |t|
      t.string :name
    end
  end

  def self.down
    drop_table :initials
  end
end

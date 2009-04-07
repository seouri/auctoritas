class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :email,               :null => true, :default => nil
      t.string    :crypted_password,    :null => true, :default => nil
      t.string    :password_salt,       :null => true, :default => nil
      t.string    :openid_identifier
      t.string    :persistence_token,   :null => false
      t.string    :single_access_token, :null => false
      t.string    :perishable_token,    :null => false
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
    end
    add_index :users, :email
    add_index :users, :openid_identifier
  end

  def self.down
    drop_table :users
  end
end

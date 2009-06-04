# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090403155424) do

  create_table "articles", :force => true do |t|
    t.string   "source"
    t.string   "source_id"
    t.integer  "journal_id"
    t.integer  "year"
    t.string   "volume"
    t.string   "issue"
    t.string   "pages"
    t.text     "title"
    t.string   "doi"
    t.integer  "authorships_count",          :default => 0
    t.integer  "verified_authorships_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["doi"], :name => "index_articles_on_doi"
  add_index "articles", ["journal_id"], :name => "index_articles_on_journal_id"
  add_index "articles", ["source", "source_id"], :name => "index_articles_on_source_and_source_id", :unique => true

  create_table "authors", :force => true do |t|
    t.string   "lastname"
    t.string   "forename"
    t.string   "initial"
    t.string   "suffix"
    t.integer  "articles_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["lastname", "forename"], :name => "index_authors_on_lastname_and_forename"
  add_index "authors", ["lastname", "initial"], :name => "index_authors_on_lastname_and_initial"

  create_table "authorships", :force => true do |t|
    t.integer  "article_id"
    t.integer  "author_id"
    t.integer  "position"
    t.string   "lastname"
    t.string   "forename"
    t.string   "initials"
    t.string   "suffix"
    t.string   "email"
    t.string   "affiliation"
    t.boolean  "verified",    :default => false
    t.integer  "verifier_id", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorships", ["article_id"], :name => "index_authorships_on_article_id"
  add_index "authorships", ["author_id"], :name => "index_authorships_on_author_id"
  add_index "authorships", ["lastname", "forename"], :name => "index_authorships_on_lastname_and_forename"
  add_index "authorships", ["lastname", "initials"], :name => "index_authorships_on_lastname_and_initials"
  add_index "authorships", ["verifier_id"], :name => "index_authorships_on_verifier_id"

  create_table "coauthorships", :force => true do |t|
    t.integer "author_id"
    t.integer "coauthor_id"
    t.integer "articles_count", :default => 0
  end

  add_index "coauthorships", ["author_id"], :name => "index_coauthorships_on_author_id"

  create_table "forenames", :force => true do |t|
    t.string "name"
  end

  add_index "forenames", ["name"], :name => "index_forenames_on_name"

  create_table "groups", :force => true do |t|
    t.integer  "owner_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["owner_id"], :name => "index_groups_on_owner_id"

  create_table "initials", :force => true do |t|
    t.string "name"
  end

  add_index "initials", ["name"], :name => "index_initials_on_name"

  create_table "journals", :force => true do |t|
    t.string  "name"
    t.string  "abbreviation"
    t.integer "articles_count", :default => 0
  end

  add_index "journals", ["name", "abbreviation"], :name => "index_journals_on_name_and_abbreviation", :unique => true

  create_table "lastnames", :force => true do |t|
    t.string "name"
  end

  add_index "lastnames", ["name"], :name => "index_lastnames_on_name"

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "suffixes", :force => true do |t|
    t.string "name"
  end

  add_index "suffixes", ["name"], :name => "index_suffixes_on_name"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "openid_identifier"
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["openid_identifier"], :name => "index_users_on_openid_identifier"

end

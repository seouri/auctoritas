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

ActiveRecord::Schema.define(:version => 20090402211313) do

  create_table "articles", :force => true do |t|
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

  create_table "authors", :force => true do |t|
    t.integer  "lastname_id"
    t.integer  "forename_id"
    t.integer  "initial_id"
    t.integer  "suffix_id"
    t.integer  "articles_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorships", :force => true do |t|
    t.integer  "article_id"
    t.integer  "author_id"
    t.integer  "position"
    t.integer  "lastname_id"
    t.integer  "forename_id"
    t.integer  "initial_id"
    t.integer  "suffix_id"
    t.string   "email"
    t.string   "affiliation"
    t.boolean  "verified",    :default => false
    t.integer  "verifier_id", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorships", ["article_id"], :name => "index_authorships_on_article_id"
  add_index "authorships", ["author_id"], :name => "index_authorships_on_author_id"

  create_table "coauthorships", :force => true do |t|
    t.integer "author_id"
    t.integer "coauthor_id"
    t.integer "articles_count", :default => 0
  end

  add_index "coauthorships", ["author_id"], :name => "index_coauthorships_on_author_id"

  create_table "forenames", :force => true do |t|
    t.string "name"
  end

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

  create_table "journals", :force => true do |t|
    t.string  "name"
    t.string  "abbreviation"
    t.string  "issn"
    t.string  "essn"
    t.integer "articles_count", :default => 0
  end

  create_table "lastnames", :force => true do |t|
    t.string "name"
  end

  create_table "suffixes", :force => true do |t|
    t.string "name"
  end

end

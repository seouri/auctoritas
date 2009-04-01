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

ActiveRecord::Schema.define(:version => 20081020220029) do

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

  create_table "authors", :force => true do |t|
    t.string   "last_name"
    t.string   "fore_name"
    t.string   "initials"
    t.string   "suffix"
    t.integer  "articles_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorships", :force => true do |t|
    t.integer  "article_id"
    t.integer  "author_id"
    t.integer  "position"
    t.string   "last_name"
    t.string   "fore_name"
    t.string   "initials"
    t.string   "suffix"
    t.string   "email"
    t.string   "affiliation"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorships", ["article_id"], :name => "index_authorships_on_article_id"
  add_index "authorships", ["author_id"], :name => "index_authorships_on_author_id"

  create_table "coauthorships", :force => true do |t|
    t.integer "author_id"
    t.integer "coauthor_id"
    t.integer "articles_count"
  end

  add_index "coauthorships", ["author_id"], :name => "index_coauthorships_on_author_id"

end

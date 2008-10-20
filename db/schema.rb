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

ActiveRecord::Schema.define(:version => 20081020162317) do

  create_table "articles", :force => true do |t|
    t.string   "journal"
    t.integer  "year"
    t.string   "volume"
    t.string   "issue"
    t.string   "pagination"
    t.text     "title"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorships", ["article_id"], :name => "index_authorships_on_article_id"

end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_28_112313) do

  create_table "comments", force: :cascade do |t|
    t.integer "post_id"
    t.string "texto"
    t.integer "favs"
    t.string "sentiment"
    t.integer "sentiment_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "texto"
    t.integer "favs"
    t.integer "hashtags"
    t.integer "shares"
    t.integer "tags"
    t.string "concept"
    t.integer "concept_score"
    t.string "keyword"
    t.integer "keyword_score"
    t.string "category"
    t.integer "category_score"
    t.string "entity"
    t.integer "entity_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "name"
  end

end

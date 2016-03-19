# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160318184307) do

  create_table "relations", force: :cascade do |t|
    t.integer  "text_id"
    t.integer  "related_text_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "relations", ["related_text_id"], name: "index_relations_on_related_text_id"
  add_index "relations", ["text_id", "related_text_id"], name: "index_relations_on_text_id_and_related_text_id", unique: true
  add_index "relations", ["text_id"], name: "index_relations_on_text_id"

  create_table "texts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

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

ActiveRecord::Schema.define(version: 20160423141513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discussions", force: :cascade do |t|
    t.text     "content"
    t.integer  "record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  add_index "discussions", ["record_id"], name: "index_discussions_on_record_id", using: :btree

  create_table "records", force: :cascade do |t|
    t.string   "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "number"
    t.integer  "sector_id"
  end

  add_index "records", ["sector_id"], name: "index_records_on_sector_id", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "discussions", "records"
  add_foreign_key "records", "sectors"
end

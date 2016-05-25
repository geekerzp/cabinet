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

ActiveRecord::Schema.define(version: 20160525024534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "paper_files", force: :cascade do |t|
    t.string   "data"
    t.string   "filename"
    t.string   "filetype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paper_relations", force: :cascade do |t|
    t.integer  "paper_id"
    t.integer  "paper_file_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["paper_file_id"], name: "index_paper_relations_on_paper_file_id", using: :btree
    t.index ["paper_id", "paper_file_id"], name: "index_paper_relations_on_paper_id_and_paper_file_id", unique: true, using: :btree
    t.index ["paper_id"], name: "index_paper_relations_on_paper_id", using: :btree
  end

  create_table "papers", force: :cascade do |t|
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

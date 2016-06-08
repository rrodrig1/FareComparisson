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

ActiveRecord::Schema.define(version: 20160608063001) do

  create_table "anticipations", force: :cascade do |t|
    t.integer  "advance"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "routes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "passengers"
    t.string   "frecuency"
    t.time     "departure"
    t.string   "destination"
    t.string   "source"
    t.integer  "anticipation_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

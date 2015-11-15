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

ActiveRecord::Schema.define(version: 20151101134934) do

  create_table "albums", force: :cascade do |t|
    t.string  "name",      limit: 255
    t.date    "released"
    t.integer "artist_id", limit: 4
  end

  add_index "albums", ["artist_id"], name: "fk_rails_124a79559a", using: :btree

  create_table "artists", force: :cascade do |t|
    t.string "name",          limit: 255
    t.string "country",       limit: 255
    t.string "language_song", limit: 255
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name",  limit: 255
  end

  create_table "carriers", force: :cascade do |t|
    t.string  "name",            limit: 255
    t.integer "type_carrier_id", limit: 4
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "pre_orders", force: :cascade do |t|
    t.integer "track_id",   limit: 4
    t.integer "carrier_id", limit: 4
  end

  add_index "pre_orders", ["carrier_id"], name: "fk_rails_b282053040", using: :btree
  add_index "pre_orders", ["track_id"], name: "fk_rails_9dd5695793", using: :btree

  create_table "tracks", force: :cascade do |t|
    t.boolean "in_orders"
    t.string  "name",      limit: 255
    t.time    "duration"
    t.integer "album_id",  limit: 4
    t.integer "genre_id",  limit: 4
    t.integer "author_id", limit: 4
    t.integer "artist_id", limit: 4
  end

  add_index "tracks", ["album_id"], name: "fk_rails_7c47d80164", using: :btree
  add_index "tracks", ["artist_id"], name: "fk_rails_d99a0cbd74", using: :btree
  add_index "tracks", ["author_id"], name: "fk_rails_0f152fb47f", using: :btree
  add_index "tracks", ["genre_id"], name: "fk_rails_e21e3bd01e", using: :btree

  create_table "type_carriers", force: :cascade do |t|
    t.string  "name",            limit: 255
    t.integer "price_of_record", limit: 4
    t.time    "max_duration"
    t.integer "capacity",        limit: 4
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "pre_orders", "carriers"
  add_foreign_key "pre_orders", "tracks"
  add_foreign_key "tracks", "albums"
  add_foreign_key "tracks", "artists"
  add_foreign_key "tracks", "authors"
  add_foreign_key "tracks", "genres"
end

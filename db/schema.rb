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

ActiveRecord::Schema.define(version: 20161005091355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pve_base_stats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "kills"
    t.integer  "deaths"
    t.decimal  "kd"
    t.integer  "suicides"
    t.integer  "assists"
    t.integer  "most_kills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pve_base_stats_on_user_id", using: :btree
  end

  create_table "pvp_base_stats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "kills"
    t.integer  "deaths"
    t.decimal  "kd"
    t.integer  "suicides"
    t.integer  "assists"
    t.integer  "most_kills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pvp_base_stats_on_user_id", using: :btree
  end

  create_table "pvp_kills_weapons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "super"
    t.integer  "granade"
    t.integer  "melee"
    t.integer  "auto_rifle"
    t.integer  "fusion"
    t.integer  "hand_canon"
    t.integer  "machine_gun"
    t.integer  "pulse_rifle"
    t.integer  "rocket_launcher"
    t.integer  "scout_rifle"
    t.integer  "shotgun"
    t.integer  "sniper"
    t.integer  "side_arm"
    t.integer  "sword"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "membership_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["membership_id"], name: "index_users_on_membership_id", using: :btree
  end

end

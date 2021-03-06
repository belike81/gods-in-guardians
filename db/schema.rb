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

ActiveRecord::Schema.define(version: 20171120122431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "character_id"
    t.integer "activity_name_id"
    t.string "activity_hash"
    t.integer "times_completed"
    t.integer "kills"
    t.integer "deaths"
    t.integer "assists"
    t.decimal "kd"
    t.integer "wins"
    t.integer "seconds_played"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "activity_type_id"
  end

  create_table "activity_names", id: :serial, force: :cascade do |t|
    t.string "activity_hash"
    t.string "activity_type_hash"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activity_types", id: :serial, force: :cascade do |t|
    t.string "activity_type_hash"
    t.string "identifier"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.time "start_time"
    t.integer "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pve_base_stats", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "kills"
    t.integer "deaths"
    t.decimal "kd"
    t.integer "suicides"
    t.integer "assists"
    t.integer "most_kills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pve_base_stats_on_user_id"
  end

  create_table "pve_kills_weapons", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "super"
    t.integer "granade"
    t.integer "melee"
    t.integer "auto_rifle"
    t.integer "fusion"
    t.integer "hand_canon"
    t.integer "machine_gun"
    t.integer "pulse_rifle"
    t.integer "rocket_launcher"
    t.integer "scout_rifle"
    t.integer "shotgun"
    t.integer "sniper"
    t.integer "side_arm"
    t.integer "sword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pvp_base_stats", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "kills"
    t.integer "deaths"
    t.decimal "kd"
    t.integer "suicides"
    t.integer "assists"
    t.integer "most_kills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "games"
    t.decimal "kills_assists"
    t.index ["user_id"], name: "index_pvp_base_stats_on_user_id"
  end

  create_table "pvp_kills_weapons", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "super"
    t.integer "granade"
    t.integer "melee"
    t.integer "auto_rifle"
    t.integer "fusion"
    t.integer "hand_canon"
    t.integer "machine_gun"
    t.integer "pulse_rifle"
    t.integer "rocket_launcher"
    t.integer "scout_rifle"
    t.integer "shotgun"
    t.integer "sniper"
    t.integer "side_arm"
    t.integer "sword"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "membership_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "platform", default: 2
    t.index ["membership_id"], name: "index_users_on_membership_id"
  end

end

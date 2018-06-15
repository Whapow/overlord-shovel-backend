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

ActiveRecord::Schema.define(version: 2018_06_15_002612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.integer "gm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_campaigns_on_discarded_at"
  end

  create_table "characters", force: :cascade do |t|
    t.integer "player_id"
    t.integer "campaign_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_characters_on_discarded_at"
  end

  create_table "entries", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "journal_id"
    t.decimal "reward", precision: 9, scale: 2
    t.integer "experience"
    t.index ["character_id"], name: "index_entries_on_character_id"
    t.index ["journal_id"], name: "index_entries_on_journal_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "character_id"
    t.string "name"
    t.string "description"
    t.decimal "value", precision: 9, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_items_on_discarded_at"
  end

  create_table "journals", force: :cascade do |t|
    t.integer "campaign_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_journals_on_discarded_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_users_on_discarded_at"
  end

end

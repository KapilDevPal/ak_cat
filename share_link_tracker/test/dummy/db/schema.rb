# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_04_06_093446) do
  create_table "share_link_tracker_link_visits", force: :cascade do |t|
    t.integer "link_id", null: false
    t.string "device_type"
    t.string "ip_address"
    t.string "location"
    t.datetime "visited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.index ["link_id"], name: "index_share_link_tracker_link_visits_on_link_id"
  end

  create_table "share_link_tracker_links", force: :cascade do |t|
    t.string "original_url"
    t.string "short_url", null: false
    t.integer "clicks_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["short_url"], name: "index_share_link_tracker_links_on_short_url", unique: true
  end

  add_foreign_key "share_link_tracker_link_visits", "share_link_tracker_links", column: "link_id"
end

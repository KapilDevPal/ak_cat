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

ActiveRecord::Schema[8.0].define(version: 2025_05_22_160803) do
  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bx_block_god_bhajans", force: :cascade do |t|
    t.integer "god_id", null: false
    t.string "bhajan_type", null: false
    t.text "text", null: false
    t.string "title"
    t.string "language"
    t.text "translation"
    t.text "meaning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["god_id"], name: "index_bx_block_god_bhajans_on_god_id"
  end

  create_table "bx_block_god_gods", force: :cascade do |t|
    t.string "name", null: false
    t.string "sanskrit_name"
    t.text "description", null: false
    t.text "significance"
    t.string "festivals"
    t.string "temples"
    t.string "mantras"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "category"
    t.string "consort_of"
    t.string "avatar_of"
    t.text "bhajans"
    t.text "chalisa"
    t.index ["name"], name: "index_bx_block_god_gods_on_name", unique: true
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gods", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "image_url"
    t.string "role"
    t.string "category"
    t.string "consort_of"
    t.string "avatar_of"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marriage_profiles_photos", force: :cascade do |t|
    t.integer "profile_id", null: false
    t.string "image_url"
    t.integer "position"
    t.boolean "is_primary", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_marriage_profiles_photos_on_profile_id"
  end

  create_table "marriage_profiles_profiles", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "occupation"
    t.string "education"
    t.string "location"
    t.text "bio"
    t.string "photo"
    t.string "passcode"
    t.boolean "passcode_enabled", default: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date_of_birth"
    t.string "photo2"
    t.string "photo3"
    t.string "profile_type", default: "marriage"
    t.string "first_name"
    t.string "last_name"
    t.string "religion"
    t.string "caste"
    t.string "income"
    t.string "height"
    t.string "marital_status"
    t.text "family_details"
    t.text "preferences"
    t.boolean "verified_status", default: false
    t.string "title"
    t.string "company"
    t.text "skills"
    t.text "experience"
    t.text "portfolio_links"
    t.string "resume"
    t.string "contact_email"
    t.string "availability"
    t.text "hobbies"
    t.text "social_links"
    t.string "availability_status"
    t.string "cover_image"
    t.index ["profile_type"], name: "index_marriage_profiles_profiles_on_profile_type"
    t.index ["user_id"], name: "index_marriage_profiles_profiles_on_user_id"
  end

  create_table "share_link_tracker_link_visits", force: :cascade do |t|
    t.integer "link_id", null: false
    t.string "device_type"
    t.string "ip_address"
    t.string "location"
    t.datetime "visited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "referrer"
    t.string "user_agent"
    t.index ["link_id"], name: "index_share_link_tracker_link_visits_on_link_id"
  end

  create_table "share_link_tracker_links", force: :cascade do |t|
    t.string "original_url"
    t.string "short_url", null: false
    t.integer "clicks_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["short_url"], name: "index_share_link_tracker_links_on_short_url", unique: true
    t.index ["user_id"], name: "index_share_link_tracker_links_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bx_block_god_bhajans", "bx_block_god_gods", column: "god_id"
  add_foreign_key "marriage_profiles_photos", "marriage_profiles_profiles", column: "profile_id"
  add_foreign_key "marriage_profiles_profiles", "users"
  add_foreign_key "share_link_tracker_link_visits", "share_link_tracker_links", column: "link_id"
  add_foreign_key "share_link_tracker_links", "users"
end

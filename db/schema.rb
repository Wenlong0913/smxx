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

ActiveRecord::Schema.define(version: 20161130052560) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
    t.index ["associated_id", "associated_type"], name: "associated_index", using: :btree
    t.index ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
    t.index ["created_at"], name: "index_audits_on_created_at", using: :btree
    t.index ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
    t.index ["user_id", "user_type"], name: "user_index", using: :btree
  end

  create_table "item_relations", id: false, force: :cascade do |t|
    t.integer "master_id"
    t.integer "slave_id"
    t.index ["master_id"], name: "index_item_relations_on_master_id", using: :btree
    t.index ["slave_id"], name: "index_item_relations_on_slave_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "name"
    t.jsonb    "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
    t.index ["site_id"], name: "index_items_on_site_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "sites", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb    "features"
    t.index ["user_id"], name: "index_sites_on_user_id", using: :btree
  end

  create_table "theme_configs", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "theme_id"
    t.text     "config"
    t.boolean  "active",     default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["site_id"], name: "index_theme_configs_on_site_id", using: :btree
    t.index ["theme_id"], name: "index_theme_configs_on_theme_id", using: :btree
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.text     "config"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tracker_actions", force: :cascade do |t|
    t.string   "name"
    t.string   "controller_path"
    t.string   "action_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tracker_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracker_share_codes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["resource_type", "resource_id"], name: "index_tracker_share_codes_on_resource_type_and_resource_id", using: :btree
    t.index ["user_id"], name: "index_tracker_share_codes_on_user_id", using: :btree
  end

  create_table "tracker_user_relations", force: :cascade do |t|
    t.integer  "master_id"
    t.integer  "slave_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["master_id"], name: "index_tracker_user_relations_on_master_id", using: :btree
    t.index ["slave_id"], name: "index_tracker_user_relations_on_slave_id", using: :btree
  end

  create_table "tracker_visits", force: :cascade do |t|
    t.integer  "session_id"
    t.integer  "action_id"
    t.integer  "user_id"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "url"
    t.string   "referer"
    t.text     "payload"
    t.string   "ip_address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.jsonb    "user_agent_data"
    t.index ["action_id"], name: "index_tracker_visits_on_action_id", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_tracker_visits_on_resource_type_and_resource_id", using: :btree
    t.index ["session_id"], name: "index_tracker_visits_on_session_id", using: :btree
    t.index ["user_id"], name: "index_tracker_visits_on_user_id", using: :btree
  end

  create_table "user_mobiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_user_mobiles_on_user_id", using: :btree
  end

  create_table "user_weixins", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "name"
    t.string   "headshot"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.integer  "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_weixins_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "headshot"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "items", "sites"
  add_foreign_key "theme_configs", "sites"
  add_foreign_key "theme_configs", "themes"
  add_foreign_key "tracker_visits", "tracker_actions", column: "action_id"
  add_foreign_key "tracker_visits", "tracker_sessions", column: "session_id"
  add_foreign_key "user_mobiles", "users"
  add_foreign_key "user_weixins", "users"
end

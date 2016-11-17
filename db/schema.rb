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

ActiveRecord::Schema.define(version: 20161117025600) do

  create_table "pages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "site_id"
    t.string   "title"
    t.string   "short_title"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["site_id"], name: "index_pages_on_site_id", using: :btree
  end

  create_table "sites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_sites_on_user_id", using: :btree
  end

  create_table "theme_configs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "site_id"
    t.integer  "theme_id"
    t.text     "config",     limit: 65535
    t.boolean  "active",                   default: false, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["site_id"], name: "index_theme_configs_on_site_id", using: :btree
    t.index ["theme_id"], name: "index_theme_configs_on_theme_id", using: :btree
  end

  create_table "themes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "display_name"
    t.text     "config",       limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "tracker_actions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "controller_name"
    t.string   "action_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "tracker_sessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tracker_visits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "session_id"
    t.integer  "action_id"
    t.integer  "user_id"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "url"
    t.string   "referer"
    t.text     "payload",       limit: 65535
    t.string   "user_agent"
    t.string   "ip_address"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["action_id"], name: "index_tracker_visits_on_action_id", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_tracker_visits_on_resource_type_and_resource_id", using: :btree
    t.index ["session_id"], name: "index_tracker_visits_on_session_id", using: :btree
    t.index ["user_id"], name: "index_tracker_visits_on_user_id", using: :btree
  end

  create_table "user_mobiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_user_mobiles_on_user_id", using: :btree
  end

  create_table "user_weixins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "theme_configs", "sites"
  add_foreign_key "theme_configs", "themes"
  add_foreign_key "tracker_visits", "tracker_actions", column: "action_id"
  add_foreign_key "tracker_visits", "tracker_sessions", column: "session_id"
  add_foreign_key "user_mobiles", "users"
  add_foreign_key "user_weixins", "users"
end

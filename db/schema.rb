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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170211155745) do
=======
ActiveRecord::Schema.define(version: 20170204080204) do
>>>>>>> purchase

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

  create_table "catalog_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "catalog_anc_desc_idx", unique: true, using: :btree
    t.index ["descendant_id"], name: "catalog_desc_idx", using: :btree
  end

  create_table "catalogs", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
    t.index ["parent_id"], name: "index_catalogs_on_parent_id", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "assetable_id",                 null: false
    t.string   "assetable_type",    limit: 30
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "cms_channels", force: :cascade do |t|
    t.integer  "site_id",     null: false
    t.integer  "parent_id"
    t.string   "title",       null: false
    t.string   "short_title", null: false
    t.string   "properties"
    t.string   "tmp_index",   null: false
    t.string   "tmp_detail",  null: false
    t.string   "keywords"
    t.string   "description"
    t.string   "image_path"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["short_title"], name: "index_cms_channels_on_short_title", using: :btree
    t.index ["site_id"], name: "index_cms_channels_on_site_id", using: :btree
  end

  create_table "cms_pages", force: :cascade do |t|
    t.integer  "channel_id",  null: false
    t.string   "title",       null: false
    t.string   "short_title", null: false
    t.string   "properties"
    t.string   "keywords"
    t.string   "description"
    t.string   "image_path"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["channel_id"], name: "index_cms_pages_on_channel_id", using: :btree
    t.index ["short_title"], name: "index_cms_pages_on_short_title", using: :btree
  end

  create_table "cms_sites", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "template",                    null: false
    t.string   "domain"
    t.string   "description"
    t.jsonb    "features"
    t.boolean  "is_published", default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "image_item_relations", force: :cascade do |t|
    t.integer  "image_item_id"
    t.string   "relation_type"
    t.integer  "relation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["image_item_id"], name: "index_image_item_relations_on_image_item_id", using: :btree
    t.index ["relation_type", "relation_id"], name: "index_image_item_relations_on_relation_type_and_relation_id", using: :btree
  end

  create_table "image_item_tags", force: :cascade do |t|
    t.integer  "image_item_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["image_item_id"], name: "index_image_item_tags_on_image_item_id", using: :btree
  end

  create_table "image_items", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "name"
    t.integer  "file_size"
    t.integer  "width"
    t.integer  "height"
    t.jsonb    "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_image_items_on_owner_type_and_owner_id", using: :btree
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
    t.string   "name_py"
    t.integer  "catalog_id"
    t.index ["site_id"], name: "index_items_on_site_id", using: :btree
  end

  create_table "market_pages", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "market_template_id"
    t.string   "name"
    t.string   "description"
    t.jsonb    "features"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["market_template_id"], name: "index_market_pages_on_market_template_id", using: :btree
    t.index ["site_id"], name: "index_market_pages_on_site_id", using: :btree
  end

  create_table "market_templates", force: :cascade do |t|
    t.integer  "catalog_id",  null: false
    t.string   "base_path",   null: false
    t.string   "name",        null: false
    t.string   "keywords"
    t.string   "description"
    t.string   "image_path"
    t.text     "html_source"
    t.text     "form_source"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["catalog_id"], name: "index_market_templates_on_catalog_id", using: :btree
  end

  create_table "material_management_details", force: :cascade do |t|
    t.integer  "material_id"
    t.integer  "material_management_id"
    t.integer  "number"
    t.decimal  "price",                  precision: 8, scale: 2
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.index ["material_management_id"], name: "index_material_management_details_on_material_management_id", using: :btree
  end

  create_table "material_managements", force: :cascade do |t|
    t.string   "note"
    t.integer  "operate_type"
    t.date     "operate_date"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "material_warehouse_id"
  end

  create_table "material_purchase_details", force: :cascade do |t|
    t.integer  "material_id"
    t.integer  "material_purchase_id"
    t.integer  "number"
    t.decimal  "price",                precision: 8, scale: 2
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.index ["material_purchase_id"], name: "index_material_purchase_details_on_material_purchase_id", using: :btree
  end

  create_table "material_purchases", force: :cascade do |t|
    t.integer  "vendor_id"
    t.jsonb    "features"
    t.integer  "created_by"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "material_stock_alerts", force: :cascade do |t|
    t.integer  "material_id"
    t.string   "title"
    t.string   "body"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "material_warehouse_items", force: :cascade do |t|
    t.integer  "material_warehouse_id"
    t.integer  "material_id"
    t.integer  "stock",                 default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "member_catalogs", force: :cascade do |t|
    t.string   "key",                     null: false
    t.text     "value",      default: [],              array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "member_notes", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "user_id"
    t.text     "message",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_member_notes_on_member_id", using: :btree
    t.index ["user_id"], name: "index_member_notes_on_user_id", using: :btree
  end

  create_table "members", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.string   "name"
    t.date     "birth"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "mobile_phone"
    t.string   "tel_phone"
    t.string   "wechat"
    t.string   "firm"
    t.string   "address"
    t.string   "note"
    t.jsonb    "features"
    t.string   "qq"
    t.index ["site_id"], name: "index_members_on_site_id", using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "order_materials", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "material_id"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["order_id"], name: "index_order_materials_on_order_id", using: :btree
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "amount"
    t.integer  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id", using: :btree
    t.index ["product_id"], name: "index_order_products_on_product_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "code"
    t.integer  "user_id"
    t.integer  "site_id"
    t.integer  "price"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "description"
    t.integer  "status"
    t.integer  "internal_status"
    t.index ["site_id"], name: "index_orders_on_site_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "produces", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "status"
    t.integer  "assignee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["order_id"], name: "index_produces_on_order_id", using: :btree
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
    t.string   "type"
    t.index ["user_id"], name: "index_sites_on_user_id", using: :btree
  end

  create_table "task_types", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "ordinal"
    t.jsonb    "roles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "title"
    t.text     "description"
    t.integer  "creator_id"
    t.integer  "assignee_id"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "ordinal"
    t.integer  "task_type_id"
    t.integer  "status"
    t.index ["resource_type", "resource_id"], name: "index_tasks_on_resource_type_and_resource_id", using: :btree
    t.index ["site_id"], name: "index_tasks_on_site_id", using: :btree
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

  create_table "vendor_relations", force: :cascade do |t|
    t.integer  "vendor_id"
    t.string   "relation_type"
    t.integer  "relation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["relation_type", "relation_id"], name: "index_vendor_relations_on_relation_type_and_relation_id", using: :btree
  end

  add_foreign_key "image_item_relations", "image_items"
  add_foreign_key "image_item_tags", "image_items"
  add_foreign_key "items", "sites"
  add_foreign_key "market_pages", "market_templates"
  add_foreign_key "market_pages", "sites"
  add_foreign_key "material_management_details", "material_managements"
<<<<<<< HEAD
  add_foreign_key "member_notes", "members"
  add_foreign_key "member_notes", "users"
=======
  add_foreign_key "material_purchase_details", "material_purchases"
>>>>>>> purchase
  add_foreign_key "members", "sites"
  add_foreign_key "members", "users"
  add_foreign_key "order_materials", "orders"
  add_foreign_key "order_products", "orders"
  add_foreign_key "orders", "sites"
  add_foreign_key "orders", "users"
  add_foreign_key "produces", "orders"
  add_foreign_key "tasks", "sites"
  add_foreign_key "theme_configs", "sites"
  add_foreign_key "theme_configs", "themes"
  add_foreign_key "tracker_visits", "tracker_actions", column: "action_id"
  add_foreign_key "tracker_visits", "tracker_sessions", column: "session_id"
  add_foreign_key "user_mobiles", "users"
  add_foreign_key "user_weixins", "users"
end

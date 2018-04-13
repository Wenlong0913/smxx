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

ActiveRecord::Schema.define(version: 20180413031920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"
  enable_extension "cube"
  enable_extension "earthdistance"

  create_table "account_histories", force: :cascade do |t|
    t.integer  "account_id"
    t.decimal  "amount",           precision: 8, scale: 2
    t.integer  "relation_account"
    t.integer  "relation_type"
    t.date     "relation_date"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["account_id"], name: "index_account_histories_on_account_id", using: :btree
  end

  create_table "accounts", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "name"
    t.decimal  "amount",     precision: 8, scale: 2
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["owner_type", "owner_id"], name: "index_accounts_on_owner_type_and_owner_id", using: :btree
  end

  create_table "address_books", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",         null: false
    t.string   "gender"
    t.string   "mobile_phone", null: false
    t.string   "city",         null: false
    t.string   "street",       null: false
    t.string   "house_number"
    t.jsonb    "features"
    t.string   "note"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_address_books_on_user_id", using: :btree
  end

  create_table "api_tokens", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "token",      limit: 64
    t.string   "device"
    t.datetime "expired_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["token"], name: "index_api_tokens_on_token", using: :btree
    t.index ["user_id"], name: "index_api_tokens_on_user_id", using: :btree
  end

  create_table "app_settings", force: :cascade do |t|
    t.string   "name"
    t.string   "key_word"
    t.json     "app_data"
    t.boolean  "active",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "article_products", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_products_on_article_id", using: :btree
    t.index ["product_id"], name: "index_article_products_on_product_id", using: :btree
  end

  create_table "article_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_article_users_on_article_id", using: :btree
    t.index ["user_id"], name: "index_article_users_on_user_id", using: :btree
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "author"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "comments_count"
    t.integer  "likes_count"
    t.integer  "community_id"
    t.date     "valid_time_begin"
    t.date     "valid_time_end"
    t.integer  "article_type"
    t.boolean  "is_top",                default: false
    t.string   "source_type"
    t.integer  "source_id"
    t.integer  "complaints_count",      default: 0
    t.boolean  "is_complainted",        default: false
    t.boolean  "is_flatform_recommend", default: false
    t.index ["source_type", "source_id"], name: "index_articles_on_source_type_and_source_id", using: :btree
  end

  create_table "attachment_relations", force: :cascade do |t|
    t.integer  "attachment_id"
    t.string   "relation_type"
    t.integer  "relation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["attachment_id"], name: "index_attachment_relations_on_attachment_id", using: :btree
    t.index ["relation_type", "relation_id"], name: "index_attachment_relations_on_relation_type_and_relation_id", using: :btree
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "name"
    t.integer  "file_size"
    t.jsonb    "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_attachments_on_owner_type_and_owner_id", using: :btree
  end

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

  create_table "banners", force: :cascade do |t|
    t.string   "title"
    t.integer  "banner_type"
    t.string   "image_url"
    t.string   "redirect_web_url"
    t.string   "redirect_app_url"
    t.jsonb    "features"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
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
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "type"
    t.jsonb    "features"
    t.boolean  "is_hot",     default: false
    t.index ["parent_id"], name: "index_catalogs_on_parent_id", using: :btree
  end

  create_table "charges", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "pingpp_charge_id"
    t.string   "channel"
    t.string   "client_ip"
    t.string   "transaction_no"
    t.string   "paid"
    t.string   "refunded"
    t.string   "time_paid"
    t.string   "time_created"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["order_id"], name: "index_charges_on_order_id", using: :btree
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_chat_messages_on_room_id", using: :btree
    t.index ["user_id"], name: "index_chat_messages_on_user_id", using: :btree
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "owner_type"
    t.integer  "owner_id"
    t.integer  "created_by"
    t.index ["owner_type", "owner_id"], name: "index_chat_rooms_on_owner_type_and_owner_id", using: :btree
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

  create_table "classorders", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "teacher_name"
    t.string   "weeknu"
    t.jsonb    "class_day"
    t.jsonb    "class_time"
    t.jsonb    "class_place"
    t.jsonb    "class_week"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_classorders_on_user_id", using: :btree
  end

  create_table "cms_channels", force: :cascade do |t|
    t.integer  "site_id",                       null: false
    t.integer  "parent_id"
    t.string   "title",                         null: false
    t.string   "short_title",                   null: false
    t.string   "properties"
    t.string   "tmp_index",                     null: false
    t.string   "tmp_detail",                    null: false
    t.string   "keywords"
    t.string   "description"
    t.string   "image_path"
    t.text     "content"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "impressions_count", default: 0
    t.index ["short_title"], name: "index_cms_channels_on_short_title", using: :btree
    t.index ["site_id"], name: "index_cms_channels_on_site_id", using: :btree
  end

  create_table "cms_comments", force: :cascade do |t|
    t.string   "contact"
    t.text     "content"
    t.jsonb    "features"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "site_id",                     null: false
    t.string   "source_type"
    t.integer  "source_id"
    t.integer  "user_id"
    t.boolean  "is_published", default: true
    t.index ["site_id"], name: "index_cms_comments_on_site_id", using: :btree
  end

  create_table "cms_keystores", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "key",         null: false
    t.string   "value",       null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["key"], name: "index_cms_keystores_on_key", using: :btree
    t.index ["site_id"], name: "index_cms_keystores_on_site_id", using: :btree
  end

  create_table "cms_pages", force: :cascade do |t|
    t.integer  "channel_id",                     null: false
    t.string   "title",                          null: false
    t.string   "short_title",                    null: false
    t.string   "keywords"
    t.string   "description"
    t.string   "image_path"
    t.text     "content"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "properties",        default: [],              array: true
    t.integer  "impressions_count", default: 0
    t.integer  "comments_count",    default: 0
    t.jsonb    "forage"
    t.index "((forage ->> 'is_foraged'::text))", name: "index_cms_pages_on_forage_is_forage", using: :btree
    t.index ["channel_id"], name: "index_cms_pages_on_channel_id", using: :btree
    t.index ["properties"], name: "index_cms_pages_on_properties", using: :gin
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
    t.integer  "site_id"
    t.string   "root_domain"
    t.index ["site_id"], name: "index_cms_sites_on_site_id", using: :btree
  end

  create_table "comment_entries", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.text     "content"
    t.integer  "position"
    t.boolean  "deleted"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "parent_id"
    t.jsonb    "features"
    t.integer  "likes_count",      default: 0
    t.integer  "complaints_count", default: 0
    t.boolean  "is_complainted",   default: false
    t.boolean  "is_published",     default: true
    t.index ["resource_type", "resource_id"], name: "index_comment_entries_on_resource_type_and_resource_id", using: :btree
  end

  create_table "communities", force: :cascade do |t|
    t.string   "name"
    t.jsonb    "features"
    t.string   "address_line"
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "address_alias_id"
    t.boolean  "is_published",                               default: true
    t.integer  "updated_by"
    t.integer  "owned_by"
    t.string   "contact_info"
    t.text     "note"
    t.decimal  "lng",              precision: 20, scale: 14
    t.decimal  "lat",              precision: 20, scale: 14
    t.index "ll_to_earth((lat)::double precision, (lng)::double precision)", name: "idx__gnomon_community", using: :gist
    t.index ["owned_by"], name: "index_communities_on_owned_by", using: :btree
    t.index ["updated_by"], name: "index_communities_on_updated_by", using: :btree
  end

  create_table "complaints", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "source_type"
    t.integer  "source_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "reason"
    t.integer  "processed_by"
    t.text     "comment"
    t.integer  "status"
    t.integer  "complaint_type"
    t.index ["source_type", "source_id"], name: "index_complaints_on_source_type_and_source_id", using: :btree
    t.index ["user_id"], name: "index_complaints_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "course_type"
    t.text     "introduction"
    t.integer  "site_id"
    t.integer  "teacher_id"
    t.jsonb    "features"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "discovers", force: :cascade do |t|
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["resource_type", "resource_id"], name: "index_discovers_on_resource_type_and_resource_id", using: :btree
  end

  create_table "diymenus", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "parent_id"
    t.integer  "button_type"
    t.string   "name",                                    null: false
    t.string   "key"
    t.string   "url",         limit: 128
    t.boolean  "is_show",                 default: false, null: false
    t.integer  "sort",                    default: 1,     null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["parent_id"], name: "index_diymenus_on_parent_id", using: :btree
    t.index ["site_id", "key"], name: "index_diymenus_on_site_id_and_key", using: :btree
    t.index ["site_id", "parent_id"], name: "index_diymenus_on_site_id_and_parent_id", using: :btree
    t.index ["site_id"], name: "index_diymenus_on_site_id", using: :btree
  end

  create_table "favorite_entries", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["resource_type", "resource_id"], name: "index_favorite_entries_on_resource_type_and_resource_id", using: :btree
    t.index ["user_id"], name: "index_favorite_entries_on_user_id", using: :btree
  end

  create_table "finance_bills", force: :cascade do |t|
    t.integer  "amount"
    t.integer  "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "code"
    t.boolean  "is_entry",   default: false
    t.integer  "site_id"
  end

  create_table "finance_histories", force: :cascade do |t|
    t.date     "operate_date"
    t.decimal  "amount",       precision: 8, scale: 2
    t.integer  "operate_type"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.integer  "created_by"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.jsonb    "features"
    t.index ["owner_type", "owner_id"], name: "index_finance_histories_on_owner_type_and_owner_id", using: :btree
  end

  create_table "forage_data_caches", force: :cascade do |t|
    t.string   "source_type"
    t.integer  "source_id"
    t.string   "title"
    t.string   "url"
    t.jsonb    "data"
    t.integer  "processed_by"
    t.boolean  "auto_merge",   default: false
    t.integer  "is_merged",    default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["is_merged"], name: "index_forage_data_caches_on_is_merged", using: :btree
    t.index ["source_type", "source_id"], name: "index_forage_data_caches_on_source_type_and_source_id", using: :btree
    t.index ["title"], name: "index_forage_data_caches_on_title", using: :btree
    t.index ["url"], name: "index_forage_data_caches_on_url", using: :btree
  end

  create_table "forage_details", force: :cascade do |t|
    t.integer  "simple_id",                     null: false
    t.string   "url",                           null: false
    t.string   "migrate_to"
    t.boolean  "can_purchase",  default: false
    t.string   "purchase_url"
    t.string   "title"
    t.string   "keywords"
    t.string   "image"
    t.string   "description"
    t.text     "content"
    t.string   "date"
    t.string   "time"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "phone"
    t.string   "price"
    t.string   "from"
    t.boolean  "has_site",      default: false
    t.string   "site_name"
    t.string   "note"
    t.jsonb    "features"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "is_merged",     default: "n"
    t.index ["simple_id"], name: "index_forage_details_on_simple_id", using: :btree
  end

  create_table "forage_run_keys", force: :cascade do |t|
    t.integer  "source_id",                  null: false
    t.date     "date"
    t.string   "is_processed", default: "n"
    t.datetime "processed_at"
    t.integer  "total_count",  default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["source_id"], name: "index_forage_run_keys_on_source_id", using: :btree
  end

  create_table "forage_simples", force: :cascade do |t|
    t.integer  "run_key_id",                 null: false
    t.string   "catalog"
    t.string   "title"
    t.string   "url",                        null: false
    t.jsonb    "features"
    t.string   "is_processed", default: "n"
    t.string   "processed_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["run_key_id"], name: "index_forage_simples_on_run_key_id", using: :btree
  end

  create_table "forage_sources", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "catalog_name"
    t.string   "url"
    t.string   "note"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "gnomon_address_aliases", force: :cascade do |t|
    t.integer  "address_id"
    t.string   "alias"
    t.boolean  "precise"
    t.integer  "confidence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_gnomon_address_aliases_on_address_id", using: :btree
    t.index ["alias"], name: "index_gnomon_address_aliases_on_alias", using: :btree
  end

  create_table "gnomon_addresses", force: :cascade do |t|
    t.integer  "district_id"
    t.integer  "street_id"
    t.string   "street_number"
    t.string   "name"
    t.decimal  "lng",           precision: 20, scale: 14
    t.decimal  "lat",           precision: 20, scale: 14
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index "ll_to_earth((lat)::double precision, (lng)::double precision)", name: "idx__gnomon_address_geo", using: :gist
    t.index ["district_id"], name: "index_gnomon_addresses_on_district_id", using: :btree
    t.index ["name"], name: "index_gnomon_addresses_on_name", using: :btree
    t.index ["street_id"], name: "index_gnomon_addresses_on_street_id", using: :btree
  end

  create_table "gnomon_businesses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_gnomon_businesses_on_name", using: :btree
  end

  create_table "gnomon_cities", force: :cascade do |t|
    t.integer  "province_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_gnomon_cities_on_name", using: :btree
    t.index ["province_id"], name: "index_gnomon_cities_on_province_id", using: :btree
  end

  create_table "gnomon_districts", force: :cascade do |t|
    t.integer  "city_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_gnomon_districts_on_city_id", using: :btree
    t.index ["name"], name: "index_gnomon_districts_on_name", using: :btree
  end

  create_table "gnomon_districts_businiesses", id: false, force: :cascade do |t|
    t.integer "district_id"
    t.integer "business_id"
    t.index ["business_id"], name: "index_gnomon_districts_businiesses_on_business_id", using: :btree
    t.index ["district_id"], name: "index_gnomon_districts_businiesses_on_district_id", using: :btree
  end

  create_table "gnomon_districts_streets", id: false, force: :cascade do |t|
    t.integer "district_id"
    t.integer "street_id"
    t.index ["district_id"], name: "index_gnomon_districts_streets_on_district_id", using: :btree
    t.index ["street_id"], name: "index_gnomon_districts_streets_on_street_id", using: :btree
  end

  create_table "gnomon_manual_geos", force: :cascade do |t|
    t.decimal  "lng",           precision: 20, scale: 14
    t.decimal  "lat",           precision: 20, scale: 14
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["resource_type", "resource_id"], name: "index_gnomon_manual_geos_on_resource_type_and_resource_id", using: :btree
  end

  create_table "gnomon_provinces", force: :cascade do |t|
    t.string   "name"
    t.boolean  "is_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_gnomon_provinces_on_name", using: :btree
  end

  create_table "gnomon_regions", force: :cascade do |t|
    t.integer  "district_id"
    t.string   "name"
    t.string   "tag"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["district_id"], name: "index_gnomon_regions_on_district_id", using: :btree
    t.index ["name"], name: "index_gnomon_regions_on_name", using: :btree
    t.index ["tag"], name: "index_gnomon_regions_on_tag", using: :btree
  end

  create_table "gnomon_regions_addresses", id: false, force: :cascade do |t|
    t.integer "region_id"
    t.integer "address_id"
    t.index ["address_id"], name: "index_gnomon_regions_addresses_on_address_id", using: :btree
    t.index ["region_id"], name: "index_gnomon_regions_addresses_on_region_id", using: :btree
  end

  create_table "gnomon_streets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_gnomon_streets_on_name", using: :btree
  end

  create_table "image_item_courses", force: :cascade do |t|
    t.integer  "image_item_id"
    t.string   "courses_type"
    t.integer  "courses_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["courses_type", "courses_id"], name: "index_image_item_courses_on_courses_type_and_courses_id", using: :btree
    t.index ["image_item_id"], name: "index_image_item_courses_on_image_item_id", using: :btree
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

  create_table "import_failed_informations", force: :cascade do |t|
    t.string   "origin_type"
    t.string   "file_name"
    t.integer  "line"
    t.string   "name"
    t.jsonb    "features"
    t.string   "is_processed", default: "n"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["is_processed"], name: "index_import_failed_informations_on_is_processed", using: :btree
    t.index ["origin_type"], name: "index_import_failed_informations_on_origin_type", using: :btree
  end

  create_table "import_informations", force: :cascade do |t|
    t.string   "origin_type"
    t.string   "file_name"
    t.integer  "line"
    t.string   "name"
    t.jsonb    "features"
    t.string   "is_parsed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["origin_type"], name: "index_import_informations_on_origin_type", using: :btree
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.text     "params"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
    t.index ["user_id"], name: "index_impressions_on_user_id", using: :btree
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
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "type"
    t.string   "name_py"
    t.integer  "catalog_id"
    t.integer  "comments_count",  default: 0
    t.integer  "favorites_count", default: 0
    t.integer  "visits_count",    default: 0
    t.integer  "likes_count",     default: 0
    t.integer  "sales_count",     default: 0
    t.jsonb    "forage"
    t.index "((forage ->> 'is_foraged'::text))", name: "index_items_on_forage_is_forage", using: :btree
    t.index ["site_id"], name: "index_items_on_site_id", using: :btree
  end

  create_table "keystores", force: :cascade do |t|
    t.string   "key",         null: false
    t.string   "value",       null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["key"], name: "index_keystores_on_key", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["resource_type", "resource_id"], name: "index_likes_on_resource_type_and_resource_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "logistics", force: :cascade do |t|
    t.integer  "order_delivery_id"
    t.integer  "delivery_id"
    t.integer  "status"
    t.integer  "update_by"
    t.integer  "create_by"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "market_pages", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "market_template_id"
    t.string   "name"
    t.string   "description"
    t.jsonb    "features"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "impressions_count",  default: 0
    t.text     "content"
    t.index ["market_template_id"], name: "index_market_pages_on_market_template_id", using: :btree
    t.index ["site_id"], name: "index_market_pages_on_site_id", using: :btree
  end

  create_table "market_templates", force: :cascade do |t|
    t.integer  "catalog_id",                  null: false
    t.string   "base_path",                   null: false
    t.string   "name",                        null: false
    t.string   "keywords"
    t.string   "description"
    t.string   "image_path"
    t.text     "html_source"
    t.text     "form_source"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "is_published", default: true
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
    t.string   "order_code"
    t.string   "created_by"
  end

  create_table "material_purchase_details", force: :cascade do |t|
    t.integer  "material_id"
    t.integer  "material_purchase_id"
    t.integer  "number"
    t.integer  "input_number",                                 default: 0
    t.decimal  "price",                precision: 8, scale: 2
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.jsonb    "features"
    t.index ["material_purchase_id"], name: "index_material_purchase_details_on_material_purchase_id", using: :btree
  end

  create_table "material_purchases", force: :cascade do |t|
    t.integer  "vendor_id"
    t.jsonb    "features"
    t.integer  "created_by"
    t.integer  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
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
    t.string   "qq"
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
    t.string   "typo"
    t.string   "from"
    t.string   "owned"
    t.index ["site_id"], name: "index_members_on_site_id", using: :btree
    t.index ["user_id"], name: "index_members_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id",            null: false
    t.integer  "actor_id"
    t.string   "notify_type",        null: false
    t.string   "target_type"
    t.integer  "target_id"
    t.string   "target_url"
    t.string   "target_name"
    t.string   "second_target_type"
    t.integer  "second_target_id"
    t.string   "second_target_url"
    t.string   "second_target_name"
    t.string   "third_target_type"
    t.integer  "third_target_id"
    t.string   "third_target_url"
    t.string   "third_target_name"
    t.string   "content"
    t.datetime "read_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["second_target_type", "second_target_id"], name: "index_notifications_on_second_target_type_and_second_target_id", using: :btree
    t.index ["target_type", "target_id"], name: "index_notifications_on_target_type_and_target_id", using: :btree
    t.index ["third_target_type", "third_target_id"], name: "index_notifications_on_third_target_type_and_third_target_id", using: :btree
  end

  create_table "order_cvs", force: :cascade do |t|
    t.string   "cabinet_no"
    t.string   "cabinet_name"
    t.integer  "order_id"
    t.jsonb    "features"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["order_id"], name: "index_order_cvs_on_order_id", using: :btree
  end

  create_table "order_deliveries", force: :cascade do |t|
    t.integer  "order_id"
    t.jsonb    "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_materials", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "material_id"
    t.integer  "amount"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "factory_expected_number"
    t.integer  "practical_number"
    t.integer  "purchase_status"
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
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "description"
    t.integer  "status"
    t.integer  "internal_status"
    t.integer  "member_id"
    t.integer  "preorder_conversition_id"
    t.integer  "create_by"
    t.integer  "update_by"
    t.string   "resource_url"
    t.date     "delivery_date"
    t.integer  "refund_status"
    t.integer  "apply_refund_by"
    t.text     "refund_description"
    t.integer  "finance_bill_id"
    t.integer  "comments_count",           default: 0
    t.jsonb    "features"
    t.boolean  "deleted",                  default: false
    t.index ["finance_bill_id"], name: "index_orders_on_finance_bill_id", using: :btree
    t.index ["site_id"], name: "index_orders_on_site_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "symbol_name"
    t.string   "name"
    t.string   "group_name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_permissions_on_name", using: :btree
    t.index ["symbol_name"], name: "index_permissions_on_symbol_name", using: :btree
  end

  create_table "produces", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "status"
    t.integer  "assignee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["order_id"], name: "index_produces_on_order_id", using: :btree
  end

  create_table "refunds", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "pingpp_charge_id"
    t.string   "event_id"
    t.string   "order_no"
    t.text     "description"
    t.string   "charge"
    t.string   "amount"
    t.string   "created"
    t.string   "charge_order_no"
    t.string   "succeed"
    t.string   "status"
    t.string   "time_succeed"
    t.string   "failure_code"
    t.string   "failure_msg"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "order_id"
    t.index ["user_id"], name: "index_refunds_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role_name"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "roles_permissions", force: :cascade do |t|
    t.integer "role_id"
    t.integer "permission_id"
    t.index ["role_id", "permission_id"], name: "index_roles_permissions_on_role_id_and_permission_id", using: :btree
  end

  create_table "sales_distribution_resource_users", force: :cascade do |t|
    t.integer  "resource_id"
    t.integer  "user_id"
    t.string   "ip"
    t.string   "user_agent"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["resource_id"], name: "idx__sdr_resource_user_resource", using: :btree
    t.index ["user_id"], name: "idx__sdr_resource_user_user", using: :btree
  end

  create_table "sales_distribution_resources", force: :cascade do |t|
    t.string   "type_name"
    t.string   "url",         limit: 255
    t.integer  "user_id"
    t.string   "object_type"
    t.integer  "object_id"
    t.string   "code"
    t.jsonb    "extra"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["object_type", "object_id"], name: "idx__sdr_object", using: :btree
    t.index ["user_id"], name: "idx__sdr_user", using: :btree
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "price"
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_shopping_carts_on_product_id", using: :btree
    t.index ["user_id"], name: "index_shopping_carts_on_user_id", using: :btree
  end

  create_table "site_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "site_anc_desc_idx", unique: true, using: :btree
    t.index ["descendant_id"], name: "site_desc_idx", using: :btree
  end

  create_table "sites", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.jsonb    "features"
    t.string   "type"
    t.integer  "address_alias_id"
    t.string   "address_line"
    t.integer  "catalog_id"
    t.integer  "favorites_count",                                 default: 0
    t.integer  "visits_count",                                    default: 0
    t.integer  "comments_count"
    t.integer  "agent_plan_id"
    t.datetime "paid_at"
    t.decimal  "lng",                   precision: 20, scale: 14
    t.decimal  "lat",                   precision: 20, scale: 14
    t.boolean  "is_flatform_recommend",                           default: false
    t.jsonb    "forage"
    t.integer  "parent_id"
    t.string   "tanmer_wxopen_token"
    t.index "((forage ->> 'is_foraged'::text))", name: "index_sites_on_forage_is_forage", using: :btree
    t.index "ll_to_earth((lat)::double precision, (lng)::double precision)", name: "idx__gnomon_site", using: :gist
    t.index ["parent_id"], name: "index_sites_on_parent_id", using: :btree
    t.index ["user_id"], name: "index_sites_on_user_id", using: :btree
  end

  create_table "staffs", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb    "features"
    t.string   "type"
    t.index ["user_id"], name: "index_staffs_on_user_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
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

  create_table "teachers", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "phone"
    t.string   "IDcard"
    t.string   "email"
    t.string   "address"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
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

  create_table "tickets", force: :cascade do |t|
    t.integer  "site_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "content"
    t.string   "type"
    t.jsonb    "features"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "comments_count", default: 0
    t.index ["site_id"], name: "index_tickets_on_site_id", using: :btree
    t.index ["user_id"], name: "index_tickets_on_user_id", using: :btree
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

  create_table "user_births", force: :cascade do |t|
    t.integer "user_id"
    t.string  "birth"
    t.index ["user_id"], name: "index_user_births_on_user_id", using: :btree
  end

  create_table "user_cardnus", force: :cascade do |t|
    t.integer "user_id"
    t.string  "cardnu"
    t.index ["user_id"], name: "index_user_cardnus_on_user_id", using: :btree
  end

  create_table "user_communities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "is_current",   default: false
    t.index ["community_id"], name: "index_user_communities_on_community_id", using: :btree
    t.index ["user_id"], name: "index_user_communities_on_user_id", using: :btree
  end

  create_table "user_locities", force: :cascade do |t|
    t.integer "user_id"
    t.string  "locity"
    t.index ["user_id"], name: "index_user_locities_on_user_id", using: :btree
  end

  create_table "user_mobiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_user_mobiles_on_user_id", using: :btree
  end

  create_table "user_relnames", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "relname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_relnames_on_user_id", using: :btree
  end

  create_table "user_sexes", force: :cascade do |t|
    t.integer "user_id"
    t.string  "sex"
    t.index ["user_id"], name: "index_user_sexes_on_user_id", using: :btree
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
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "access_token"
    t.string   "refresh_token"
    t.string   "unionid"
    t.datetime "access_token_expired_at"
    t.datetime "refresh_token_expired_at"
    t.index ["user_id"], name: "index_user_weixins_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "headshot"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "description",            limit: 500
    t.integer  "gender"
    t.string   "relname"
    t.string   "cardnu"
    t.string   "birth"
    t.string   "locity"
    t.string   "sex"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_permissions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "permission_id"
    t.index ["user_id", "permission_id"], name: "index_users_permissions_on_user_id_and_permission_id", using: :btree
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

  add_foreign_key "account_histories", "accounts"
  add_foreign_key "address_books", "users"
  add_foreign_key "article_products", "articles"
  add_foreign_key "article_users", "articles"
  add_foreign_key "attachment_relations", "attachments"
  add_foreign_key "charges", "orders"
  add_foreign_key "classorders", "users"
  add_foreign_key "complaints", "users"
  add_foreign_key "image_item_courses", "image_items"
  add_foreign_key "image_item_relations", "image_items"
  add_foreign_key "image_item_tags", "image_items"
  add_foreign_key "items", "sites"
  add_foreign_key "market_pages", "market_templates"
  add_foreign_key "market_pages", "sites"
  add_foreign_key "material_management_details", "material_managements"
  add_foreign_key "material_purchase_details", "material_purchases"
  add_foreign_key "member_notes", "members"
  add_foreign_key "member_notes", "users"
  add_foreign_key "members", "sites"
  add_foreign_key "members", "users"
  add_foreign_key "order_cvs", "orders"
  add_foreign_key "order_materials", "orders"
  add_foreign_key "order_products", "orders"
  add_foreign_key "orders", "finance_bills"
  add_foreign_key "orders", "sites"
  add_foreign_key "orders", "users"
  add_foreign_key "produces", "orders"
  add_foreign_key "refunds", "users"
  add_foreign_key "shopping_carts", "users"
  add_foreign_key "tasks", "sites"
  add_foreign_key "theme_configs", "sites"
  add_foreign_key "theme_configs", "themes"
  add_foreign_key "tickets", "sites"
  add_foreign_key "tickets", "users"
  add_foreign_key "tracker_visits", "tracker_actions", column: "action_id"
  add_foreign_key "tracker_visits", "tracker_sessions", column: "session_id"
  add_foreign_key "user_births", "users"
  add_foreign_key "user_cardnus", "users"
  add_foreign_key "user_communities", "communities"
  add_foreign_key "user_communities", "users"
  add_foreign_key "user_locities", "users"
  add_foreign_key "user_mobiles", "users"
  add_foreign_key "user_relnames", "users"
  add_foreign_key "user_sexes", "users"
  add_foreign_key "user_weixins", "users"
end

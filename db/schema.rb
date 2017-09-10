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

ActiveRecord::Schema.define(version: 20170513094747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "aed_models", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.text     "characteristics", default: [],              array: true
  end

  create_table "aeds", force: :cascade do |t|
    t.string    "name"
    t.string    "city"
    t.string    "address"
    t.geography "lonlat",        limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.datetime  "created_at",                                                                         null: false
    t.datetime  "updated_at",                                                                         null: false
    t.json      "images"
    t.integer   "approved",                                                               default: 0
    t.string    "area"
    t.string    "district"
    t.string    "phone"
    t.string    "owner"
    t.string    "description"
    t.integer   "aed_model_id"
    t.string    "location_type"
    t.string    "availability"
    t.string    "email"
  end

  add_index "aeds", ["aed_model_id"], name: "index_aeds_on_aed_model_id", using: :btree
  add_index "aeds", ["lonlat"], name: "index_aeds_on_lonlat", using: :gist

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type", using: :btree

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.json     "images"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "publication_date"
  end

  create_table "news_subscribes", force: :cascade do |t|
    t.string   "email"
    t.boolean  "subscribed", default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "news_tags", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "news_id"
  end

  add_index "news_tags", ["news_id"], name: "index_news_tags_on_news_id", using: :btree
  add_index "news_tags", ["tag_id"], name: "index_news_tags_on_tag_id", using: :btree

  create_table "participant_trainings", force: :cascade do |t|
    t.integer "training_id"
    t.integer "user_id"
  end

  add_index "participant_trainings", ["training_id"], name: "index_participant_trainings_on_training_id", using: :btree
  add_index "participant_trainings", ["user_id"], name: "index_participant_trainings_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "canonical_name"
    t.text     "description"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "image"
    t.integer  "status",         default: 0
  end

  create_table "settings", force: :cascade do |t|
    t.integer  "setting_type",   default: 0
    t.string   "affected_model"
    t.string   "value"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "trainings", force: :cascade do |t|
    t.string   "name"
    t.integer  "duration"
    t.integer  "prerequisite", default: 0
    t.datetime "start_date"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.json     "images"
    t.text     "description"
    t.integer  "status",       default: 0
  end

  create_table "trainings_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "training_id"
  end

  create_table "user_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "role",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "grade_title"
    t.text     "bio"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.json     "images"
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
    t.string   "phone"
    t.integer  "user_group_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_group_id"], name: "index_users_on_user_group_id", using: :btree

  create_table "vacancies", force: :cascade do |t|
    t.string   "name"
    t.string   "short_description"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "image"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

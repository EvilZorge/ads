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

ActiveRecord::Schema.define(version: 20141202205630) do

  create_table "ads_images", force: true do |t|
    t.integer  "advertisment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "ads_images", ["advertisment_id"], name: "ads_images_advertisment_id_fk", using: :btree

  create_table "advertisments", force: true do |t|
    t.string   "title",                               null: false
    t.text     "body",                                null: false
    t.integer  "user_id"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",            default: "sketch"
    t.string   "ban_reason"
    t.integer  "country_id"
    t.integer  "city_id"
    t.integer  "condition_id"
    t.integer  "style_id"
    t.integer  "mileage_id"
    t.integer  "year_id"
    t.integer  "engine_id"
    t.integer  "engine_volume_id"
    t.integer  "door_id"
    t.integer  "color_id"
    t.integer  "transmission_id"
    t.integer  "make_id"
    t.integer  "model_id"
    t.string   "price",                               null: false
  end

  add_index "advertisments", ["city_id"], name: "index_advertisments_on_city_id", using: :btree
  add_index "advertisments", ["color_id"], name: "index_advertisments_on_color_id", using: :btree
  add_index "advertisments", ["condition_id"], name: "index_advertisments_on_condition_id", using: :btree
  add_index "advertisments", ["country_id"], name: "index_advertisments_on_country_id", using: :btree
  add_index "advertisments", ["door_id"], name: "index_advertisments_on_door_id", using: :btree
  add_index "advertisments", ["engine_id"], name: "index_advertisments_on_engine_id", using: :btree
  add_index "advertisments", ["engine_volume_id"], name: "index_advertisments_on_engine_volume_id", using: :btree
  add_index "advertisments", ["make_id"], name: "index_advertisments_on_make_id", using: :btree
  add_index "advertisments", ["mileage_id"], name: "index_advertisments_on_mileage_id", using: :btree
  add_index "advertisments", ["model_id"], name: "index_advertisments_on_model_id", using: :btree
  add_index "advertisments", ["price"], name: "index_advertisments_on_price", using: :btree
  add_index "advertisments", ["style_id"], name: "index_advertisments_on_style_id", using: :btree
  add_index "advertisments", ["transmission_id"], name: "index_advertisments_on_transmission_id", using: :btree
  add_index "advertisments", ["type_id"], name: "advertisments_type_id_fk", using: :btree
  add_index "advertisments", ["user_id"], name: "advertisments_user_id_fk", using: :btree
  add_index "advertisments", ["year_id"], name: "index_advertisments_on_year_id", using: :btree

  create_table "advertisments_features", force: true do |t|
    t.integer "advertisment_id"
    t.integer "feature_id"
  end

  create_table "cities", force: true do |t|
    t.string  "name"
    t.integer "country_id"
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id", using: :btree
  add_index "cities", ["name"], name: "index_cities_on_name", unique: true, using: :btree

  create_table "colors", force: true do |t|
    t.string "name"
  end

  add_index "colors", ["name"], name: "index_colors_on_name", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.string   "body"
    t.integer  "advertisment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["advertisment_id"], name: "comments_advertisment_id_fk", using: :btree
  add_index "comments", ["user_id"], name: "comments_user_id_fk", using: :btree

  create_table "conditions", force: true do |t|
    t.string "name"
  end

  add_index "conditions", ["name"], name: "index_conditions_on_name", unique: true, using: :btree

  create_table "countries", force: true do |t|
    t.string "name"
  end

  add_index "countries", ["name"], name: "index_countries_on_name", unique: true, using: :btree

  create_table "doors", force: true do |t|
    t.string "name"
  end

  add_index "doors", ["name"], name: "index_doors_on_name", unique: true, using: :btree

  create_table "engine_volumes", force: true do |t|
    t.string "name"
  end

  add_index "engine_volumes", ["name"], name: "index_engine_volumes_on_name", unique: true, using: :btree

  create_table "engines", force: true do |t|
    t.string "name"
  end

  add_index "engines", ["name"], name: "index_engines_on_name", unique: true, using: :btree

  create_table "features", force: true do |t|
    t.string "name"
  end

  create_table "makes", force: true do |t|
    t.string "name"
  end

  add_index "makes", ["name"], name: "index_makes_on_name", unique: true, using: :btree

  create_table "mileages", force: true do |t|
    t.string "name"
  end

  add_index "mileages", ["name"], name: "index_mileages_on_name", unique: true, using: :btree

  create_table "models", force: true do |t|
    t.string  "name"
    t.integer "make_id"
  end

  add_index "models", ["make_id"], name: "index_models_on_make_id", using: :btree
  add_index "models", ["name"], name: "index_models_on_name", unique: true, using: :btree

  create_table "reviews", force: true do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "assignee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["assignee_id"], name: "reviews_assignee_id_fk", using: :btree
  add_index "reviews", ["user_id"], name: "reviews_user_id_fk", using: :btree

  create_table "styles", force: true do |t|
    t.string "name"
  end

  add_index "styles", ["name"], name: "index_styles_on_name", unique: true, using: :btree

  create_table "transmissions", force: true do |t|
    t.string "name"
  end

  add_index "transmissions", ["name"], name: "index_transmissions_on_name", unique: true, using: :btree

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   default: "user"
    t.string   "nickname"
    t.string   "name"
    t.string   "surname"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "years", force: true do |t|
    t.string "name"
  end

  add_index "years", ["name"], name: "index_years_on_name", unique: true, using: :btree

end

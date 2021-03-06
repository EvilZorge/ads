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

ActiveRecord::Schema.define(version: 20141207223014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads_images", force: true do |t|
    t.integer  "advertisment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "advertisments", force: true do |t|
    t.string   "title",                         null: false
    t.text     "body",                          null: false
    t.integer  "user_id"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",      default: "sketch"
    t.string   "ban_reason"
  end

  create_table "cars", force: true do |t|
    t.integer "advertisment_id"
    t.integer "make_id"
    t.integer "model_id"
    t.integer "country_id"
    t.integer "city_id"
    t.integer "condition_id"
    t.integer "style_id"
    t.integer "mileage_id"
    t.integer "year_id"
    t.integer "engine_id"
    t.integer "engine_volume_id"
    t.integer "transmission_id"
    t.integer "door_id"
    t.integer "color_id"
    t.string  "price"
  end

  create_table "cars_features", force: true do |t|
    t.integer "car_id"
    t.integer "feature_id"
  end

  create_table "cars_features", force: true do |t|
    t.integer "car_id"
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
    t.string   "body",            null: false
    t.integer  "advertisment_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "body",        null: false
    t.integer  "user_id"
    t.integer  "assignee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "nickname",                                null: false
    t.string   "name",                                    null: false
    t.string   "surname",                                 null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "years", force: true do |t|
    t.string "name"
  end

  add_index "years", ["name"], name: "index_years_on_name", unique: true, using: :btree

  add_foreign_key "ads_images", "advertisments", name: "ads_images_advertisment_id_fk"

  add_foreign_key "advertisments", "types", name: "advertisments_type_id_fk"
  add_foreign_key "advertisments", "users", name: "advertisments_user_id_fk"

  add_foreign_key "cars", "advertisments", name: "cars_advertisment_id_fk"
  add_foreign_key "cars", "cities", name: "cars_city_id_fk"
  add_foreign_key "cars", "colors", name: "cars_color_id_fk"
  add_foreign_key "cars", "conditions", name: "cars_condition_id_fk"
  add_foreign_key "cars", "countries", name: "cars_country_id_fk"
  add_foreign_key "cars", "doors", name: "cars_door_id_fk"
  add_foreign_key "cars", "engine_volumes", name: "cars_engine_volume_id_fk"
  add_foreign_key "cars", "engines", name: "cars_engine_id_fk"
  add_foreign_key "cars", "makes", name: "cars_make_id_fk"
  add_foreign_key "cars", "mileages", name: "cars_mileage_id_fk"
  add_foreign_key "cars", "models", name: "cars_model_id_fk"
  add_foreign_key "cars", "styles", name: "cars_style_id_fk"
  add_foreign_key "cars", "transmissions", name: "cars_transmission_id_fk"
  add_foreign_key "cars", "years", name: "cars_year_id_fk"

  add_foreign_key "cars_features", "cars", name: "cars_features_car_id_fk"
  add_foreign_key "cars_features", "features", name: "cars_features_feature_id_fk"

  add_foreign_key "cities", "countries", name: "cities_country_id_fk"

  add_foreign_key "comments", "advertisments", name: "comments_advertisment_id_fk"
  add_foreign_key "comments", "users", name: "comments_user_id_fk"

  add_foreign_key "models", "makes", name: "models_make_id_fk"

  add_foreign_key "reviews", "users", name: "reviews_assignee_id_fk", column: "assignee_id"
  add_foreign_key "reviews", "users", name: "reviews_user_id_fk"

end

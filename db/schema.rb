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

ActiveRecord::Schema[7.0].define(version: 2022_07_14_111614) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routs", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "rout_id"
    t.integer "station_index"
    t.datetime "arrive_time"
    t.datetime "outgo_time"
  end

  create_table "routs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "train_id"
    t.bigint "base_station_id"
    t.bigint "end_station_id"
    t.string "user_first_name"
    t.string "user_last_name"
    t.string "user_middle_name"
    t.string "user_passport"
    t.index ["base_station_id"], name: "index_tickets_on_base_station_id"
    t.index ["end_station_id"], name: "index_tickets_on_end_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "current_station_id"
    t.integer "rout_id"
    t.boolean "order_van", default: false
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.text "first_name"
    t.text "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vans", force: :cascade do |t|
    t.integer "top_seats"
    t.integer "bottom_seats"
    t.bigint "train_id"
    t.integer "number"
    t.integer "side_top_seats"
    t.integer "side_bottom_seats"
    t.integer "econom_seats"
    t.string "type"
    t.index ["train_id"], name: "index_vans_on_train_id"
    t.index ["type"], name: "index_vans_on_type"
  end

end

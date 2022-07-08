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

ActiveRecord::Schema[7.0].define(version: 2022_07_08_110346) do
  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routs", force: :cascade do |t|
    t.integer "railway_station_id"
    t.integer "rout_id"
    t.integer "station_index"
  end

  create_table "routs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "user_id"
    t.integer "train_id"
    t.integer "base_station_id"
    t.integer "end_station_id"
    t.index ["base_station_id"], name: "index_tickets_on_base_station_id"
    t.index ["end_station_id"], name: "index_tickets_on_end_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_station_id"
    t.integer "rout_id"
    t.boolean "order_van", default: false
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vans", force: :cascade do |t|
    t.integer "top_seats"
    t.integer "bottom_seats"
    t.integer "train_id"
    t.integer "number"
    t.integer "side_top_seats"
    t.integer "side_bottom_seats"
    t.integer "econom_seats"
    t.string "type"
    t.index ["train_id"], name: "index_vans_on_train_id"
  end

end
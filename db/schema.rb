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

ActiveRecord::Schema[7.0].define(version: 2023_06_08_170046) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "places", force: :cascade do |t|
    t.text "description", null: false
    t.string "photo"
    t.string "location", null: false
    t.integer "rate", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_places_on_owner_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "place_id", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.integer "bill", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
    t.index ["place_id"], name: "index_reservations_on_place_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "places", "users", column: "owner_id"
  add_foreign_key "reservations", "places"
  add_foreign_key "reservations", "users", column: "customer_id"
end

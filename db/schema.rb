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

ActiveRecord::Schema[7.2].define(version: 2026_08_27_233718) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_admins_on_company_id"
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consumers", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "address"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_consumers_on_company_id"
    t.index ["email"], name: "index_consumers_on_email", unique: true
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price", precision: 10, scale: 2
    t.bigint "provider_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_menus_on_provider_id"
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "price", precision: 10, scale: 2
    t.decimal "discounted_price", precision: 10, scale: 2
    t.string "address"
    t.integer "amount"
    t.integer "status"
    t.bigint "consumer_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consumer_id"], name: "index_orders_on_consumer_id"
    t.index ["schedule_id"], name: "index_orders_on_schedule_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_providers_on_email", unique: true
  end

  create_table "schedules", force: :cascade do |t|
    t.date "date"
    t.time "deadline"
    t.integer "amount"
    t.bigint "menu_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_schedules_on_menu_id"
  end

  add_foreign_key "admins", "companies"
  add_foreign_key "consumers", "companies"
  add_foreign_key "menus", "providers"
  add_foreign_key "orders", "consumers"
  add_foreign_key "orders", "schedules"
  add_foreign_key "schedules", "menus"
end

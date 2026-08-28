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

ActiveRecord::Schema[7.2].define(version: 2026_08_28_142712) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.date "month"
    t.decimal "amount", precision: 10, scale: 2
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_accounts_on_owner"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_admins_on_company_id"
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "benefits", force: :cascade do |t|
    t.integer "amount"
    t.string "description"
    t.integer "percentage"
    t.date "due_date"
    t.bigint "consumer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consumer_id"], name: "index_benefits_on_consumer_id"
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

  create_table "notification_configurations", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "payments", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_payments_on_account_id"
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

  create_table "user_notifications", force: :cascade do |t|
    t.bigint "notification_configuration_id", null: false
    t.string "user_type", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_configuration_id"], name: "index_user_notifications_on_notification_configuration_id"
    t.index ["user_type", "user_id"], name: "index_user_notifications_on_user"
  end

  add_foreign_key "admins", "companies"
  add_foreign_key "benefits", "consumers"
  add_foreign_key "consumers", "companies"
  add_foreign_key "menus", "providers"
  add_foreign_key "orders", "consumers"
  add_foreign_key "orders", "schedules"
  add_foreign_key "payments", "accounts"
  add_foreign_key "schedules", "menus"
  add_foreign_key "user_notifications", "notification_configurations"
end

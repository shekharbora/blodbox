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

ActiveRecord::Schema[7.0].define(version: 2023_08_15_072316) do
  create_table "active_admin_comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "device_infos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "mfg_date"
    t.string "mode_name"
    t.string "setting"
    t.bigint "device_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "min_temperature"
    t.string "max_temperature"
    t.string "min_weight"
    t.string "max_weight"
    t.string "name"
    t.index ["device_id"], name: "index_device_infos_on_device_id"
  end

  create_table "device_patient_logs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "event"
    t.string "password"
    t.decimal "temperature", precision: 10
    t.decimal "weight", precision: 10
    t.integer "lock"
    t.integer "status"
    t.bigint "patient_id", null: false
    t.bigint "device_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_device_patient_logs_on_device_id"
    t.index ["patient_id"], name: "index_device_patient_logs_on_patient_id"
  end

  create_table "device_patients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "status"
    t.bigint "device_id", null: false
    t.bigint "patient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_device_patients_on_device_id"
    t.index ["patient_id"], name: "index_device_patients_on_patient_id"
  end

  create_table "device_requests", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "message"
    t.bigint "device_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_assigne", default: false
    t.index ["device_id"], name: "index_device_requests_on_device_id"
  end

  create_table "devices", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_devices_on_code"
  end

  create_table "hospitals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "address"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hospitals_on_user_id"
  end

  create_table "notifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.boolean "is_read"
    t.string "message"
    t.bigint "device_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_notifications_on_device_id"
  end

  create_table "patients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "address"
    t.bigint "hospital_id", null: false
    t.bigint "device_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "age"
    t.string "blod_group"
    t.string "gender"
    t.string "dob"
    t.index ["device_id"], name: "index_patients_on_device_id"
    t.index ["hospital_id"], name: "index_patients_on_hospital_id"
  end

  create_table "user_devices", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "device_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_user_devices_on_device_id"
    t.index ["user_id"], name: "index_user_devices_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "device_infos", "devices"
  add_foreign_key "device_patient_logs", "devices"
  add_foreign_key "device_patient_logs", "patients"
  add_foreign_key "device_patients", "devices"
  add_foreign_key "device_patients", "patients"
  add_foreign_key "device_requests", "devices"
  add_foreign_key "hospitals", "users"
  add_foreign_key "notifications", "devices"
  add_foreign_key "patients", "devices"
  add_foreign_key "patients", "hospitals"
  add_foreign_key "user_devices", "devices"
  add_foreign_key "user_devices", "users"
end

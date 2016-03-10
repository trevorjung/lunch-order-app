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

ActiveRecord::Schema.define(version: 20160117215144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lunches", force: :cascade do |t|
    t.date     "date"
    t.string   "entree"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "month"
    t.integer  "school_id"
    t.text     "description"
    t.string   "image"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "student_name"
    t.decimal  "price"
    t.decimal  "tax",          precision: 10, scale: 3
    t.decimal  "subtotal",     precision: 10, scale: 3
    t.decimal  "total",        precision: 10, scale: 3
    t.date     "date"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "user_id"
    t.string   "email"
    t.integer  "school_id"
    t.string   "school_name"
    t.string   "entree"
  end

  create_table "school_lunches", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "lunch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "school_name"
    t.string   "entree"
    t.date     "date"
    t.string   "month"
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selected_days", force: :cascade do |t|
    t.date     "date"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lunch_id"
  end

  create_table "student_schools", force: :cascade do |t|
    t.integer  "school_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_users", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "student_name"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "school_id"
  end

  create_table "students_schools", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "school_id"
    t.integer  "student_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "school"
    t.string   "family_name"
    t.string   "parent_contact"
    t.integer  "phone"
    t.string   "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

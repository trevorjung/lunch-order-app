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

ActiveRecord::Schema.define(version: 20160114050947) do

  create_table "lunches", force: :cascade do |t|
    t.date     "date"
    t.boolean  "vegetarian"
    t.string   "entree",       limit: 255
    t.string   "drink",        limit: 255
    t.integer  "entree_extra", limit: 4
    t.integer  "drink_extra",  limit: 4
    t.string   "salad",        limit: 255
    t.string   "fruit",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "month",        limit: 255
    t.integer  "school_id",    limit: 4
    t.text     "description",  limit: 65535
  end

  create_table "orders", force: :cascade do |t|
    t.string   "student_name", limit: 255
    t.decimal  "price",                    precision: 10
    t.decimal  "tax",                      precision: 10, scale: 3
    t.decimal  "subtotal",                 precision: 10, scale: 3
    t.decimal  "total",                    precision: 10, scale: 3
    t.date     "date"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "user_id",      limit: 4
    t.string   "email",        limit: 255
    t.integer  "school_id",    limit: 4
    t.string   "school_name",  limit: 255
    t.string   "entree",       limit: 255
  end

  create_table "school_lunches", force: :cascade do |t|
    t.integer  "school_id",   limit: 4
    t.integer  "lunch_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "school_name", limit: 255
    t.string   "entree",      limit: 255
    t.date     "date"
    t.string   "month",       limit: 255
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selected_days", force: :cascade do |t|
    t.date     "date"
    t.string   "status",     limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "order_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lunch_id",   limit: 4
  end

  create_table "student_users", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "student_name", limit: 255
    t.integer  "grade",        limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "school",                 limit: 255
    t.string   "family_name",            limit: 255
    t.string   "parent_contact",         limit: 255
    t.integer  "phone",                  limit: 4
    t.string   "address",                limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

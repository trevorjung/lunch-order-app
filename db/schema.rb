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

ActiveRecord::Schema.define(version: 20151217044622) do

  create_table "families", force: :cascade do |t|
    t.string   "school",         limit: 255
    t.string   "family_name",    limit: 255
    t.string   "parent_contact", limit: 255
    t.integer  "phone",          limit: 4
    t.string   "email",          limit: 255
    t.string   "address",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "family_id",    limit: 4
    t.string   "family_name",  limit: 255
    t.string   "student_name", limit: 255
    t.decimal  "price",                    precision: 10
    t.decimal  "tax",                      precision: 10
    t.decimal  "subtotal",                 precision: 10
    t.decimal  "total",                    precision: 10
    t.date     "date"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "student_name", limit: 255
    t.integer  "grade",        limit: 4
    t.integer  "family_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20131008105447) do

  create_table "appraisal_cycles", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "department_roles", force: true do |t|
    t.integer  "role_id"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "department_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "department_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kra_attrs", force: true do |t|
    t.string   "name"
    t.float    "weightage"
    t.text     "desc"
    t.text     "measures"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kra_ratings", force: true do |t|
    t.integer  "kra_sheet_id"
    t.integer  "kra_attr_id"
    t.float    "rating"
    t.text     "comment"
    t.boolean  "rated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kra_role_attrs", force: true do |t|
    t.integer  "kra_attr_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "kra_sheets", force: true do |t|
    t.integer  "appraisal_cycle_id"
    t.integer  "appraisee_id"
    t.integer  "appraiser_id"
    t.boolean  "appraisee_status",   default: false
    t.boolean  "appraiser_status",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "overall_performances", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "appraisal_cycles_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "phone_no"
    t.integer  "emp_code"
    t.date     "dob"
    t.date     "doj"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

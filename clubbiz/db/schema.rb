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

ActiveRecord::Schema.define(version: 20140516064927) do

  create_table "club_comments", force: true do |t|
    t.string   "comment_type"
    t.string   "comment_title"
    t.string   "comment_body"
    t.string   "comment_url"
    t.integer  "user_id"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs", force: true do |t|
    t.string   "club_name"
    t.string   "club_description"
    t.string   "club_website"
    t.string   "rego_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_comments", force: true do |t|
    t.string   "comment_type"
    t.string   "comment_title"
    t.string   "comment_body"
    t.string   "comment_url"
    t.integer  "user_id"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "event_name"
    t.string   "event_description"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string   "external_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "club_id"
  end

  create_table "memberships", force: true do |t|
    t.integer  "club_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "shared_events", force: true do |t|
    t.integer  "club_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "ticket_allocations", force: true do |t|
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "tickets", force: true do |t|
    t.string   "ticket_type"
    t.string   "ticket_cost"
    t.datetime "start_sale_datetime"
    t.datetime "end_sale_datetime"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "users", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

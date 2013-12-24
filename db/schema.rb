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

ActiveRecord::Schema.define(version: 20131126113713) do

  create_table "biographies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "biographies_exhibits", force: true do |t|
    t.integer "exhibit_id"
    t.integer "biography_id"
  end

  create_table "exhibitions", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "adress"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "virtual"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exhibitions_exhibits", force: true do |t|
    t.integer "exhibition_id"
    t.integer "exhibit_id"
  end

  add_index "exhibitions_exhibits", ["exhibit_id"], name: "index_exhibitions_exhibits_on_exhibit_id"
  add_index "exhibitions_exhibits", ["exhibition_id"], name: "index_exhibitions_exhibits_on_exhibition_id"

  create_table "exhibits", force: true do |t|
    t.string   "name"
    t.string   "registration_number"
    t.date     "date_of_receipt"
    t.string   "fund_creator"
    t.string   "opportunity_for_transportation"
    t.string   "the_degree_of_preservation"
    t.boolean  "authenticity"
    t.boolean  "the_electronic_version"
    t.string   "size"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "available",                      default: true
  end

  create_table "exhibits_tags", force: true do |t|
    t.integer "exhibit_id"
    t.integer "tag_id"
  end

  create_table "pictures", force: true do |t|
    t.string   "name"
    t.integer  "exhibit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "pictures", ["exhibit_id"], name: "index_pictures_on_exhibit_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

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

ActiveRecord::Schema.define(version: 20170811092653) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "codes", force: :cascade do |t|
    t.text     "body"
    t.integer  "tip_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "language_id"
    t.integer  "user_id"
    t.text     "url"
    t.text     "note"
  end

  add_index "codes", ["language_id"], name: "index_codes_on_language_id"
  add_index "codes", ["tip_id"], name: "index_codes_on_tip_id"
  add_index "codes", ["user_id"], name: "index_codes_on_user_id"

  create_table "command_platforms", force: :cascade do |t|
    t.integer  "command_id"
    t.integer  "platform_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "command_platforms", ["command_id"], name: "index_command_platforms_on_command_id"
  add_index "command_platforms", ["id"], name: "index_command_platforms_on_id", unique: true
  add_index "command_platforms", ["platform_id"], name: "index_command_platforms_on_platform_id"

  create_table "commands", force: :cascade do |t|
    t.text     "description"
    t.text     "command"
    t.text     "url"
    t.integer  "tip_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.text     "platform_ids"
    t.string   "app_version"
  end

  add_index "commands", ["id"], name: "index_commands_on_id", unique: true
  add_index "commands", ["tip_id"], name: "index_commands_on_tip_id"
  add_index "commands", ["user_id"], name: "index_commands_on_user_id"

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "version"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string   "name"
    t.string   "version"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "label_name"
  end

  add_index "platforms", ["id"], name: "index_platforms_on_id", unique: true

  create_table "tips", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "topic_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "tips", ["id"], name: "index_tips_on_id", unique: true
  add_index "tips", ["topic_id"], name: "index_tips_on_topic_id"
  add_index "tips", ["user_id"], name: "index_tips_on_user_id"

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "topic_id"
    t.integer  "category_id"
  end

  add_index "topics", ["category_id"], name: "index_topics_on_category_id"
  add_index "topics", ["id"], name: "index_topics_on_id", unique: true
  add_index "topics", ["topic_id"], name: "index_topics_on_topic_id"

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

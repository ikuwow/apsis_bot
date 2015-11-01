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

ActiveRecord::Schema.define(version: 20151101170715) do

  create_table "tweet_logs", force: :cascade do |t|
    t.integer  "tweet_id",   limit: 4, null: false
    t.datetime "tweeted_at",           null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "tweet_logs", ["tweet_id"], name: "fk_rails_d4b7f64ce7", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.integer  "twitter_account_id", limit: 4,   null: false
    t.string   "content",            limit: 255, null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "tweets", ["twitter_account_id"], name: "fk_rails_5e2f8da970", using: :btree

  create_table "twitter_accounts", force: :cascade do |t|
    t.integer  "user_id",             limit: 4,   null: false
    t.integer  "twitter_user_id",     limit: 8,   null: false
    t.string   "access_token",        limit: 255
    t.string   "access_token_secret", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "twitter_accounts", ["user_id"], name: "fk_rails_287de1faaf", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "tweet_logs", "tweets"
  add_foreign_key "tweets", "twitter_accounts"
  add_foreign_key "twitter_accounts", "users"
end

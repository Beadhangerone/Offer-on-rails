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

ActiveRecord::Schema.define(version: 20160825120859) do

  create_table "ads", force: true do |t|
    t.text     "author"
    t.text     "category"
    t.text     "bill_type"
    t.text     "ad_header"
    t.text     "ad_text"
    t.integer  "views",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ads", ["ad_header"], name: "index_ads_on_ad_header"
  add_index "ads", ["bill_type"], name: "index_ads_on_bill_type"
  add_index "ads", ["category"], name: "index_ads_on_category"
  add_index "ads", ["id"], name: "index_ads_on_id"
  add_index "ads", ["views"], name: "index_ads_on_views"

  create_table "categories", force: true do |t|
    t.text "category"
    t.text "url"
  end

  add_index "categories", ["category"], name: "index_categories_on_category"
  add_index "categories", ["url"], name: "index_categories_on_url"

  create_table "users", force: true do |t|
    t.text     "username"
    t.text     "pass"
    t.text     "phone"
    t.integer  "total_ads",  default: 0
    t.integer  "reputation", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["id"], name: "index_users_on_id"
  add_index "users", ["reputation"], name: "index_users_on_reputation"
  add_index "users", ["username"], name: "index_users_on_username"

end

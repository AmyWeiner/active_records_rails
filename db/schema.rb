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

ActiveRecord::Schema.define(version: 20130918132757) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "sub"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "datetime"
    t.string   "location_url"
    t.string   "artist"
    t.integer  "venue_id"
    t.integer  "city_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "films", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "detail_url"
    t.string   "country"
    t.string   "start"
    t.string   "director"
    t.string   "actors"
    t.string   "screenplay"
    t.string   "duration"
    t.string   "age"
    t.string   "rating"
    t.string   "image_url"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screenings", force: true do |t|
    t.datetime "datetime"
    t.boolean  "omu"
    t.boolean  "ov"
    t.integer  "screenable_id"
    t.string   "screenable_type"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "kind"
    t.string   "street1"
    t.string   "street2"
    t.string   "city"
    t.string   "district"
    t.string   "zip"
    t.string   "country"
    t.string   "email"
    t.string   "phone"
    t.string   "web"
    t.string   "transport"
    t.string   "lat"
    t.string   "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

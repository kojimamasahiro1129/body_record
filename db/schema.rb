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

ActiveRecord::Schema.define(version: 2020_11_07_014547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_times", force: :cascade do |t|
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calories_burneds", force: :cascade do |t|
    t.string "name"
    t.float "mets"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.string "sense"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "calorie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "foods_records", force: :cascade do |t|
    t.integer "food_id"
    t.integer "record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.float "weight"
    t.float "bmi"
    t.float "fat"
    t.string "img"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "breackfast"
    t.string "dinner"
    t.string "lunch"
    t.text "breakfast_text"
    t.text "lunch_text"
    t.text "dinner_text"
    t.json "images"
  end

  create_table "results", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.float "mets"
    t.string "sense"
    t.date "date"
    t.integer "minutes"
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "calories_burneds_id"
  end

  create_table "targets", force: :cascade do |t|
    t.float "weight"
    t.float "bmi"
    t.float "fat"
    t.string "img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

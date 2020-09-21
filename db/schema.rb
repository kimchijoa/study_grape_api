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

ActiveRecord::Schema.define(version: 2020_09_21_050445) do

  create_table "grape_survey01s", force: :cascade do |t|
    t.string "title"
    t.string "sub_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grape_surveys", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.string "singer"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.string "title"
    t.date "data"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "s_tests", force: :cascade do |t|
    t.string "q_title"
    t.string "q_sub_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survey_q_item_lists", force: :cascade do |t|
    t.integer "survey_q_item_id"
    t.integer "survey_id"
    t.string "item"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_survey_q_item_lists_on_survey_id"
    t.index ["survey_q_item_id"], name: "index_survey_q_item_lists_on_survey_q_item_id"
  end

  create_table "survey_q_items", force: :cascade do |t|
    t.string "question_type"
    t.string "title"
    t.string "desc"
    t.integer "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_survey_q_items_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
    t.string "sub_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

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

ActiveRecord::Schema.define(version: 2021_12_30_144033) do

  create_table "lessons", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "tag_id", null: false
    t.integer "evaluation_id", null: false
    t.integer "access_id", null: false
    t.string "name", null: false
    t.text "content", null: false
    t.integer "attending_style", null: false
    t.integer "contract_period", null: false
    t.integer "price", null: false
    t.boolean "is_in_lecture", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_23_032050) do

  create_table "addresses", charset: "utf8", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.string "name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.integer "shipping_fee", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_lessons", charset: "utf8", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", charset: "utf8", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.string "profile", default: ""
    t.string "image_id", default: ""
    t.boolean "is_deleted", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "evaluations", charset: "utf8", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "evaluation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lesson_id", null: false
    t.text "review", null: false
  end

  create_table "have_lessons", charset: "utf8", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "lesson_id", null: false
    t.integer "is_in_study", default: 0, null: false
    t.integer "progress", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", charset: "utf8", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "category_id", null: false
    t.string "name", null: false
    t.text "content", null: false
    t.integer "attending_style", null: false
    t.string "access", null: false
    t.integer "contract_period", null: false
    t.integer "price", null: false
    t.boolean "is_in_lecture", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", charset: "utf8", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "lesson_id", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", charset: "utf8", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "address_id", null: false
    t.integer "payment_method_id", null: false
    t.integer "shipping_fee", default: 500, null: false
    t.integer "total_price", null: false
    t.integer "order_status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payment_methods", charset: "utf8", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "method", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reply_relationships", charset: "utf8", force: :cascade do |t|
    t.integer "main_comment_id", null: false
    t.integer "reply_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_lists", charset: "utf8", force: :cascade do |t|
    t.integer "lesson_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

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

ActiveRecord::Schema.define(version: 20160306182406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "vertical_image"
    t.text     "description"
  end

  create_table "categorypics", force: :cascade do |t|
    t.string   "image"
    t.integer  "category_id"
    t.integer  "subcategory_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "categorypics", ["category_id"], name: "index_categorypics_on_category_id", using: :btree
  add_index "categorypics", ["subcategory_id"], name: "index_categorypics_on_subcategory_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "image"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["product_id"], name: "index_images_on_product_id", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "quantity",   default: 1
    t.float    "sellprice"
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.float    "price"
    t.float    "power"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "options", ["product_id"], name: "index_options_on_product_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "payment_type"
    t.float    "totalsum"
  end

  create_table "powers", force: :cascade do |t|
    t.integer  "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sku"
    t.text     "intro_text"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "category_id"
    t.float    "voltage"
    t.float    "electric_current"
    t.string   "advertising_main_slider"
    t.boolean  "hotproduct"
    t.string   "main_slider_image"
    t.integer  "subcategory_id"
  end

  add_index "products", ["subcategory_id"], name: "index_products_on_subcategory_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "product_id"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree
  add_index "subcategories", ["product_id"], name: "index_subcategories_on_product_id", using: :btree

  add_foreign_key "categorypics", "categories"
  add_foreign_key "images", "products"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "products"
  add_foreign_key "options", "products"
  add_foreign_key "products", "subcategories"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "subcategories", "products"
end

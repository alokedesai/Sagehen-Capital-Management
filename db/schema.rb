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

ActiveRecord::Schema.define(version: 20140805044133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "add_presentation_attributes_to_posts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alums", force: true do |t|
    t.string   "linkedin_url"
    t.integer  "grad_year"
    t.string   "position_held"
    t.string   "job_title"
    t.string   "company"
    t.string   "location"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "position_type"
    t.integer  "position_order"
    t.boolean  "current_management", default: true
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "current_managements", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position_order"
    t.boolean  "is_vp"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "type"
  end

  create_table "presentations", force: true do |t|
    t.string   "ticker"
    t.string   "action"
    t.text     "thesis"
    t.string   "slideshare_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recruiters", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company"
    t.string   "interest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remove_attributes_from_presentations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "slideshare_html"
  end

  create_table "stocks", force: true do |t|
    t.string   "ticker"
    t.string   "company_name"
    t.date     "purchase_date"
    t.integer  "purchase_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "share_count"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "major"
    t.string   "access"
    t.string   "grad_year"
    t.text     "description"
    t.string   "linkedin_url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
    t.string   "linkedin_id"
    t.boolean  "approved"
  end

end

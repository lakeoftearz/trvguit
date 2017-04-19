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

ActiveRecord::Schema.define(version: 20170419124845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fcomps", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "webpage"
    t.string   "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "rules"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "fullname"
    t.string   "email"
    t.string   "band"
    t.string   "country"
    t.integer  "fcomp_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "published",  default: false
    t.boolean  "publicinfo", default: true
    t.index ["fcomp_id"], name: "index_reviews_on_fcomp_id", using: :btree
    t.index ["title", "created_at"], name: "index_reviews_on_title_and_created_at", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin"
  end

  add_foreign_key "reviews", "fcomps"
end

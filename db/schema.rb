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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110515182817) do

  create_table "appadmins", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assets", :force => true do |t|
    t.integer  "project_id"
    t.time     "running_time"
    t.string   "version_name"
    t.string   "media"
    t.string   "cut_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.date     "version_date"
    t.integer  "version_number"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "release_date"
  end

  create_table "requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "asset_id"
    t.date     "required_date"
    t.string   "status"
    t.integer  "approver_id"
    t.string   "recipient_name"
    t.string   "delivery_method"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "approval_date"
    t.datetime "fulfillment_date"
    t.integer  "fulfilled_by"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.string   "name"
  end

end

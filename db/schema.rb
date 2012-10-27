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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121027183225) do

  create_table "essays", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.string   "description"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.text     "needs"
    t.string   "location"
    t.float    "lat"
    t.float    "lng"
    t.integer  "map_zoom_level"
    t.integer  "cover_image_id"
    t.boolean  "is_featured",    :default => false
    t.boolean  "is_active",      :default => false
    t.string   "contact_name"
    t.string   "contact_email"
    t.text     "notes"
  end

  create_table "photos", :force => true do |t|
    t.integer  "essay_id"
    t.string   "file"
    t.string   "content_type"
    t.string   "file_size"
    t.string   "width"
    t.string   "height"
    t.string   "caption"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.boolean  "is_admin",        :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end

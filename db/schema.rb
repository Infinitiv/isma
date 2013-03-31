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

ActiveRecord::Schema.define(:version => 20130304173738) do

  create_table "article_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.date     "exp_date"
    t.boolean  "commentable",     :default => true
    t.boolean  "published",       :default => true
    t.boolean  "fixed",           :default => false
    t.integer  "article_type_id"
    t.integer  "user_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "division_id"
    t.integer  "group_id"
  end

  add_index "articles", ["group_id"], :name => "index_articles_on_group_id"

  create_table "attachments", :force => true do |t|
    t.integer  "article_id"
    t.string   "name"
    t.binary   "data"
    t.string   "mime_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "attachments", ["article_id"], :name => "index_attachments_on_article_id"

  create_table "comments", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "content"
  end

  create_table "details", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "division_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "divisions", :force => true do |t|
    t.string   "name"
    t.string   "location_verbose"
    t.float    "location_geo_latitude",  :default => 56.997932
    t.float    "location_geo_longitude", :default => 40.983124
    t.integer  "division_type_id"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "group_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "parent_id"
    t.boolean  "administrator"
    t.boolean  "moderator"
    t.boolean  "writer"
    t.boolean  "reader"
    t.boolean  "commentator"
  end

  create_table "permissions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "post_lists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.integer  "post_list_id"
    t.integer  "division_id"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "posts", ["division_id"], :name => "index_posts_on_division_id"
  add_index "posts", ["post_list_id"], :name => "index_posts_on_post_list_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "profiles", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "degree"
    t.string   "title"
    t.string   "email"
    t.string   "phone"
    t.binary   "avatar"
    t.binary   "thumbnail"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end

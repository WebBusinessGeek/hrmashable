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

ActiveRecord::Schema.define(:version => 20130812093942) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.date     "birthday"
    t.integer  "zipcode"
    t.text     "about_me"
    t.string   "profile_pic"
    t.integer  "role",                   :default => 1,  :null => false
    t.string   "slug"
    t.string   "type"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true
  add_index "admin_users", ["slug"], :name => "index_admin_users_on_slug", :unique => true

  create_table "authorizations", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "blogs", :force => true do |t|
    t.string   "title",                         :null => false
    t.text     "description"
    t.string   "main_pic"
    t.string   "slug"
    t.integer  "visitors_count", :default => 0
    t.integer  "author_id",                     :null => false
    t.integer  "category_id",                   :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "blogs", ["slug"], :name => "index_blogs_on_slug", :unique => true

  create_table "blogs_tags", :force => true do |t|
    t.integer "blog_id"
    t.integer "tag_id"
  end

  create_table "blogs_users", :force => true do |t|
    t.integer "blog_id"
    t.integer "user_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "title",                             :null => false
    t.string   "slug"
    t.integer  "parent_category_id", :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug", :unique => true

  create_table "comments", :force => true do |t|
    t.text     "message",                          :null => false
    t.integer  "user_id",                          :null => false
    t.integer  "blog_id",                          :null => false
    t.integer  "parent_comment_id", :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "likes", :force => true do |t|
    t.integer  "liker_id",      :null => false
    t.string   "liker_type",    :null => false
    t.integer  "likeable_id",   :null => false
    t.string   "likeable_type", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "likes", ["likeable_id", "likeable_type"], :name => "index_likes_on_likeable_id_and_likeable_type"
  add_index "likes", ["liker_id", "liker_type"], :name => "index_likes_on_liker_id_and_liker_type"

  create_table "tags", :force => true do |t|
    t.string   "title",      :null => false
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["slug"], :name => "index_tags_on_slug", :unique => true

end

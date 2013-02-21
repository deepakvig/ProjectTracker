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

ActiveRecord::Schema.define(:version => 20130128102654) do

  create_table "comments", :force => true do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "feature_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "comments", ["feature_id"], :name => "index_comments_on_feature_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "feature_histories", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "priority"
    t.string   "status"
    t.string   "accepted"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "feature_id"
  end

  add_index "feature_histories", ["project_id"], :name => "index_feature_histories_on_project_id"
  add_index "feature_histories", ["user_id"], :name => "index_feature_histories_on_user_id"

  create_table "features", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "priority"
    t.string   "status"
    t.string   "accepted"
  end

  add_index "features", ["project_id"], :name => "index_features_on_project_id"
  add_index "features", ["user_id"], :name => "index_features_on_user_id"

  create_table "invitations", :force => true do |t|
    t.string   "email"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "invitations", ["project_id"], :name => "index_invitations_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

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

ActiveRecord::Schema.define(:version => 20120204195656) do

  create_table "authentications", :force => true do |t|
    t.integer  "usersecure_id"
    t.string   "provider"
    t.string   "fuserid"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "uid"
  end

  create_table "constants", :force => true do |t|
    t.string   "title"
    t.string   "value"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "title"
    t.string   "value"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", :force => true do |t|
    t.string   "title",                     :default => "",  :null => false
    t.text     "description"
    t.string   "photourl"
    t.integer  "isactive",     :limit => 1, :default => 1
    t.float    "defaultprice",              :default => 0.0
    t.integer  "minimumseats",              :default => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupattends", :force => true do |t|
    t.integer  "group_id",                         :null => false
    t.integer  "usersecure_id"
    t.integer  "numofinstallments", :default => 0
    t.integer  "paymentstatus",     :default => 0
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "title",           :limit => 15, :default => "",  :null => false
    t.integer  "user_id",                                        :null => false
    t.date     "startdate",                                      :null => false
    t.date     "enddate",                                        :null => false
    t.string   "password_digest"
    t.string   "grouptype",                     :default => "",  :null => false
    t.integer  "experience_id"
    t.integer  "payment_id"
    t.text     "description"
    t.integer  "form_id"
    t.time     "time",                                           :null => false
    t.integer  "isactive",        :limit => 1,  :default => 1
    t.integer  "isvalid",         :limit => 1,  :default => 0
    t.string   "invitationurl",                 :default => "1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "numberofseats"
    t.integer  "usersecure_id"
  end

  create_table "invites", :force => true do |t|
    t.integer  "group_id"
    t.string   "email"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "firstname",                     :default => "user"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "phone"
    t.integer  "mobile"
    t.integer  "isFBUser",         :limit => 1, :default => 0
    t.integer  "isGroupOrganiser", :limit => 1, :default => 0
    t.string   "photourl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usersecures", :force => true do |t|
    t.string   "email",                               :default => "",            :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "",            :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "user_id"
    t.datetime "created_at",                                                     :null => false
    t.datetime "updated_at",                                                     :null => false
    t.string   "firstname",                           :default => "user"
    t.string   "lastname"
    t.integer  "mobile"
    t.string   "photourl",                            :default => "userimg.jpg"
    t.integer  "usertype",             :limit => 1,   :default => 1
  end

  add_index "usersecures", ["email"], :name => "index_usersecures_on_email", :unique => true
  add_index "usersecures", ["reset_password_token"], :name => "index_usersecures_on_reset_password_token", :unique => true

end

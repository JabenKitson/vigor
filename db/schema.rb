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

ActiveRecord::Schema.define(:version => 20130530215814) do

  create_table "attachments", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "recipe_id"
    t.integer  "vegresource_id"
    t.integer  "post_id"
    t.integer  "review_id"
    t.string   "caption"
    t.integer  "vrhighlight_id"
    t.integer  "photo_width"
    t.integer  "photo_height"
    t.integer  "eligibility"
    t.text     "photo_meta"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "comments", :force => true do |t|
    t.text    "body"
    t.integer "post_id"
  end

  create_table "contributes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "donations", :force => true do |t|
    t.integer  "contact_id"
    t.date     "date"
    t.boolean  "new_member"
    t.boolean  "renewal"
    t.text     "comments"
    t.string   "earmark"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "ecat"
    t.string   "etitle"
    t.text     "einfo"
    t.datetime "edate"
    t.datetime "etimestart"
    t.datetime "etimeend"
    t.string   "elocation"
    t.string   "econtactname"
    t.string   "econtactphone"
    t.string   "econtactemail"
    t.text     "edirections"
    t.text     "emaps"
    t.string   "ecost"
    t.text     "elinkmoreinfo"
    t.boolean  "active"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
  end

  create_table "friends", :force => true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "hphone"
    t.string   "wphone"
    t.string   "cphone"
    t.string   "fax"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "list_cats", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lists", :force => true do |t|
    t.integer  "friend_id"
    t.integer  "list_cat_id"
    t.date     "expires"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.integer  "author_id"
    t.datetime "updated_at", :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.text     "ingredients"
    t.text     "instructions"
    t.integer  "category_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "user_id"
  end

  create_table "reviews", :force => true do |t|
    t.text     "body"
    t.text     "rating"
    t.integer  "vegresource_id"
    t.integer  "event_id"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "title"
    t.integer  "recipe_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

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
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "vegresources", :force => true do |t|
    t.string   "name"
    t.string   "website"
    t.text     "address"
    t.text     "info"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "author"
    t.string   "vrtype"
    t.integer  "vrhighlights_id"
  end

  create_table "vegresources_vrattributes", :force => true do |t|
    t.integer "vegresource_id"
    t.integer "vrattribute_id"
  end

  create_table "vraas", :force => true do |t|
    t.integer  "vrattribute_id"
    t.integer  "vegresource_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "vrattribute_assignments", :force => true do |t|
    t.integer  "vrattribute_id"
    t.integer  "vegresource_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "vrattributes", :force => true do |t|
    t.string   "vrtype"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vrhighlights", :force => true do |t|
    t.decimal  "price"
    t.date     "date_observed"
    t.string   "name"
    t.string   "product_url"
    t.string   "recipe_url"
    t.integer  "user_id"
    t.text     "description"
    t.integer  "rating"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "vegresource_id"
  end

end

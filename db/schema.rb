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

ActiveRecord::Schema.define(:version => 20120620182407) do

  create_table "cycles", :force => true do |t|
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "program_type"
    t.integer  "mesocycle_id"
    t.integer  "program_id"
    t.string   "name"
  end

  create_table "exercises", :force => true do |t|
    t.string   "key"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lift_sets", :force => true do |t|
    t.integer  "workout_id"
    t.integer  "exercise_id"
    t.string   "reps"
    t.integer  "weight"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "note"
  end

  create_table "mesocycles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "program_id"
    t.integer  "max_bench"
    t.integer  "max_squat"
    t.integer  "max_deadlift"
    t.integer  "max_ohp"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "programs", :force => true do |t|
    t.string   "key"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "workouts", :force => true do |t|
    t.integer  "cycle_id"
    t.string   "title"
    t.boolean  "completed"
    t.datetime "completed_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end

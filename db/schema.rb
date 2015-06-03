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

ActiveRecord::Schema.define(version: 20150603184948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "management_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "middlename"
    t.string   "login"
    t.boolean  "active"
    t.integer  "staff_role_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "managements", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staff_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "can_add_issue",               default: false
    t.boolean  "can_edit_issue",              default: false
    t.boolean  "can_change_issue_status",     default: false
    t.boolean  "can_shutdown_app",            default: false
    t.boolean  "can_view_issue_report_local", default: false
    t.boolean  "can_view_employees_list",     default: false
    t.boolean  "can_view_issue_report_owned", default: false
    t.boolean  "can_view_aws_list_owned",     default: false
    t.boolean  "can_view_work_changes_owned", default: false
    t.boolean  "can_fill_control_list",       default: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subdivisions", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "login"
    t.boolean  "is_active",      default: true
    t.string   "position"
    t.integer  "staff_role_id"
    t.integer  "subdivision_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

end

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

ActiveRecord::Schema.define(version: 20150830101025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.integer  "management_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "auto_work_spaces", force: :cascade do |t|
    t.string   "uuid"
    t.string   "computername"
    t.string   "short_name"
    t.string   "os"
    t.string   "os_user"
    t.text     "comment",         default: ""
    t.string   "location"
    t.boolean  "is_used",         default: true
    t.boolean  "allow_anonymous", default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "deny_close",      default: true
  end

  create_table "auto_work_spaces_work_spaces", id: false, force: :cascade do |t|
    t.integer "auto_work_space_id", null: false
    t.integer "work_space_id",      null: false
  end

  create_table "critical_types", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "weight",     default: 1
  end

  create_table "exclusion_days", force: :cascade do |t|
    t.date     "day"
    t.integer  "turn_type_id"
    t.integer  "turn_scheme_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "issue_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "critical_type_id"
    t.boolean  "is_enabled",       default: true
  end

  create_table "issue_types_issues", id: false, force: :cascade do |t|
    t.integer "issue_id",      null: false
    t.integer "issue_type_id", null: false
  end

  create_table "issue_types_work_spaces", id: false, force: :cascade do |t|
    t.integer "work_space_id", null: false
    t.integer "issue_type_id", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.integer  "status_id"
    t.integer  "work_space_id"
    t.datetime "close_date"
    t.datetime "due_date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "author_id"
    t.integer  "assigned_id"
    t.integer  "violator_id"
    t.integer  "modifier_id"
    t.text     "note_due"
    t.text     "note_measures"
    t.text     "info"
    t.integer  "issue_type_id"
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
    t.boolean  "can_manage_org_structure",    default: false
    t.boolean  "area_owner",                  default: false
    t.boolean  "subdivision_owner",           default: false
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

  create_table "turn_schemes", force: :cascade do |t|
    t.string   "name"
    t.text     "comment",      default: ""
    t.integer  "turn_type_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "turn_types", force: :cascade do |t|
    t.string   "name"
    t.time     "first_start_at"
    t.time     "first_duration"
    t.time     "second_start_at"
    t.time     "second_duration"
    t.integer  "reminder_before_end"
    t.boolean  "is_day_off"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "support2",            default: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "login"
    t.boolean  "is_active",           default: true
    t.string   "position"
    t.integer  "staff_role_id"
    t.integer  "subdivision_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "encrypted_password",  default: "",   null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["is_active"], name: "index_users_on_is_active", using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["staff_role_id"], name: "index_users_on_staff_role_id", using: :btree
  add_index "users", ["subdivision_id"], name: "index_users_on_subdivision_id", using: :btree

  create_table "work_spaces", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.string   "short_name"
    t.integer  "subdivision_id"
    t.boolean  "is_used",        default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "turn_scheme_id"
  end

  add_index "work_spaces", ["subdivision_id"], name: "index_work_spaces_on_subdivision_id", using: :btree

  add_foreign_key "areas", "managements"
  add_foreign_key "subdivisions", "areas"
  add_foreign_key "users", "staff_roles"
end

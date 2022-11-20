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

ActiveRecord::Schema.define(version: 2022_11_20_064430) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_lists", force: :cascade do |t|
    t.string "c_name"
    t.integer "credit"
    t.string "classify"
    t.string "sub_type"
    t.integer "sub_num"
    t.integer "target_grade"
    t.integer "limit_num"
    t.string "lecture_time"
    t.bigint "department_id"
    t.bigint "professor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_class_lists_on_department_id"
    t.index ["professor_id"], name: "index_class_lists_on_professor_id"
  end

  create_table "class_statuses", force: :cascade do |t|
    t.string "status", default: "신청"
    t.integer "score"
    t.bigint "student_id"
    t.bigint "class_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_list_id"], name: "index_class_statuses_on_class_list_id"
    t.index ["student_id"], name: "index_class_statuses_on_student_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "dep_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string "pro_name"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_professors_on_department_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "s_name"
    t.integer "s_num"
    t.integer "grade"
    t.boolean "admin"
    t.index ["department_id"], name: "index_students_on_department_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  add_foreign_key "class_lists", "departments"
  add_foreign_key "class_lists", "professors"
  add_foreign_key "class_statuses", "class_lists"
  add_foreign_key "class_statuses", "students"
  add_foreign_key "professors", "departments"
  add_foreign_key "students", "departments"
end

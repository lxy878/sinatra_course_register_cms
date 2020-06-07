# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_05_194616) do

  create_table "categories", force: :cascade do |t|
    t.string "title"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "department_id"
    t.integer "professor_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "category_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.integer "department_id"
  end

  create_table "student_courses", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "department_id"
  end

end

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

ActiveRecord::Schema.define(version: 2021_05_15_224931) do

  create_table "academic_semesters", force: :cascade do |t|
    t.string "term"
    t.integer "year"
  end

  create_table "academic_term_codes", force: :cascade do |t|
    t.integer "term_code"
  end

  create_table "advisors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "uga_myid"
    t.string "password_digest"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
  end

  create_table "majors", force: :cascade do |t|
    t.string "name"
    t.integer "department_id"
  end

  create_table "petitions", force: :cascade do |t|
    t.string "petition_type"
    t.string "content"
    t.integer "advisor_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "uga_myid"
    t.integer "major_id"
    t.text "matriculation_term"
    t.text "graduation_term"
    t.integer "advisor_id"
  end

  create_table "term_codes_and_semesters", id: false, force: :cascade do |t|
    t.integer "academic_term_code_id", null: false
    t.integer "academic_semester_id", null: false
  end

end

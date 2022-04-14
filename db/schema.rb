# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2022_04_12_232256) do
=======
ActiveRecord::Schema.define(version: 2022_04_11_230044) do
>>>>>>> dc8d77f71cdabded9bc43a71a0e7845978ba059c

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string "message"
    t.string "audience"
    t.string "urgency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "eventtime", precision: 6
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "category"
    t.integer "priority"
    t.datetime "added", precision: 6
    t.string "user_add"
    t.datetime "complete_time", precision: 6
    t.string "user_complete"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "active", default: true
  end

end

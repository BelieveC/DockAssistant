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

ActiveRecord::Schema.define(version: 20161106040043) do

  create_table "appointments", force: :cascade do |t|
    t.datetime "datetime"
    t.integer  "vendor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "dock_workers", force: :cascade do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "address"
    t.integer  "state_id"
    t.string   "zipcode"
    t.float    "pay_rate"
    t.boolean  "archived"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dock_workers_timeslots", id: false, force: :cascade do |t|
    t.integer "dock_worker_id"
    t.integer "timeslot_id"
    t.index ["dock_worker_id", "timeslot_id"], name: "index_dock_workers_timeslots_on_dock_worker_id_and_timeslot_id"
  end

  create_table "docks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "docks_timeslots", id: false, force: :cascade do |t|
    t.integer "dock_id"
    t.integer "timeslot_id"
    t.index ["dock_id", "timeslot_id"], name: "index_docks_timeslots_on_dock_id_and_timeslot_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "appointment_id"
    t.integer  "dock_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.integer  "dock_worker_id"
    t.integer  "appointment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "starttime"
    t.datetime "endtime"
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

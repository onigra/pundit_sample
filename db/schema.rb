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

ActiveRecord::Schema.define(version: 20140405053043) do

  create_table "abilities", force: true do |t|
    t.string   "domain"
    t.string   "ability"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_abilities", force: true do |t|
    t.integer  "role_id"
    t.integer  "ability_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles_abilities", ["ability_id"], name: "index_roles_abilities_on_ability_id", using: :btree
  add_index "roles_abilities", ["role_id"], name: "index_roles_abilities_on_role_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

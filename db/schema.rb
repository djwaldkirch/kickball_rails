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

ActiveRecord::Schema.define(version: 2019_07_08_000207) do

  create_table "games", force: :cascade do |t|
    t.integer "no_of_innings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "opponent"
    t.date "date"
    t.integer "user_id"
    t.integer "team_id"
    t.index ["team_id"], name: "index_games_on_team_id"
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "innings", force: :cascade do |t|
    t.string "p"
    t.string "c"
    t.string "first"
    t.string "third"
    t.string "lr"
    t.string "rr"
    t.string "l"
    t.string "lc"
    t.string "rc"
    t.string "r"
    t.text "bench"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.index ["game_id"], name: "index_innings_on_game_id"
  end

  create_table "kicking_orders", force: :cascade do |t|
    t.integer "game_id"
    t.text "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_kicking_orders_on_game_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.boolean "good_kicker"
    t.string "p1"
    t.string "p2"
    t.string "p3"
    t.string "p4"
    t.string "p5"
    t.string "p6"
    t.string "p7"
    t.string "p8"
    t.string "p9"
    t.string "p10"
    t.string "p11"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.boolean "active", default: true
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

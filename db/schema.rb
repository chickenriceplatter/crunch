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

ActiveRecord::Schema.define(:version => 20130925123601) do

  create_table "conversions", :force => true do |t|
    t.string   "year"
    t.string   "player_name"
    t.float    "field_goals_made"
    t.float    "field_goals_attempted"
    t.float    "three_pointers_made"
    t.float    "three_pointers_attempted"
    t.float    "free_throws_made"
    t.float    "free_throws_attempted"
    t.float    "offensive_rebounds"
    t.float    "defensive_rebounds"
    t.float    "total_rebounds"
    t.float    "assists"
    t.float    "steals"
    t.float    "blocks"
    t.float    "turnovers"
    t.float    "points_scored"
    t.float    "true_point_value"
    t.integer  "stat_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "season_id"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "participations", :force => true do |t|
    t.integer  "season_id"
    t.integer  "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "full_name"
    t.integer  "height"
    t.integer  "weight"
    t.date     "dob"
    t.string   "college"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ratios", :force => true do |t|
    t.string   "year"
    t.float    "field_goals_made"
    t.float    "field_goals_attempted"
    t.float    "three_pointers_made"
    t.float    "three_pointers_attempted"
    t.float    "free_throws_made"
    t.float    "free_throws_attempted"
    t.float    "offensive_rebounds"
    t.float    "defensive_rebounds"
    t.float    "total_rebounds"
    t.float    "assists"
    t.float    "steals"
    t.float    "blocks"
    t.float    "turnovers"
    t.float    "points_scored"
    t.integer  "season_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "records", :force => true do |t|
    t.string   "team_name"
    t.integer  "games_played"
    t.integer  "minutes_played"
    t.integer  "field_goals_made"
    t.integer  "field_goals_attempted"
    t.integer  "three_pointers_made"
    t.integer  "three_pointers_attempted"
    t.integer  "free_throws_made"
    t.integer  "free_throws_attempted"
    t.integer  "offensive_rebounds"
    t.integer  "defensive_rebounds"
    t.integer  "total_rebounds"
    t.integer  "assists"
    t.integer  "steals"
    t.integer  "blocks"
    t.integer  "turnovers"
    t.integer  "personal_fouls"
    t.integer  "points_scored"
    t.integer  "season_id"
    t.integer  "team_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "seasons", :force => true do |t|
    t.string   "year"
    t.integer  "number_of_games_played_per_team"
    t.integer  "total_number_of_games"
    t.integer  "number_of_teams"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "stats", :force => true do |t|
    t.string   "player_name"
    t.integer  "age"
    t.integer  "games_played"
    t.integer  "games_started"
    t.integer  "minutes_played"
    t.integer  "field_goals_made"
    t.integer  "field_goals_attempted"
    t.integer  "three_pointers_made"
    t.integer  "three_pointers_attempted"
    t.integer  "free_throws_made"
    t.integer  "free_throws_attempted"
    t.integer  "offensive_rebounds"
    t.integer  "defensive_rebounds"
    t.integer  "total_rebounds"
    t.integer  "assists"
    t.integer  "steals"
    t.integer  "blocks"
    t.integer  "turnovers"
    t.integer  "personal_fouls"
    t.integer  "points_scored"
    t.integer  "player_id"
    t.integer  "season_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.integer  "season_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

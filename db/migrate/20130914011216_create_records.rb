class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
    	t.string :team_name
    	t.integer :games_played
        t.integer :minutes_played
    	t.integer :field_goals_made
    	t.integer :field_goals_attempted
    	t.integer :three_pointers_made
    	t.integer :three_pointers_attempted
    	t.integer :free_throws_made
    	t.integer :free_throws_attempted
    	t.integer :offensive_rebounds
    	t.integer :defensive_rebounds
        t.integer :total_rebounds
    	t.integer :assists
    	t.integer :steals
    	t.integer :blocks
    	t.integer :turnovers
    	t.integer :personal_fouls
    	t.integer :points_scored

    	t.references :season
    	t.references :team

      t.timestamps
    end
  end
end

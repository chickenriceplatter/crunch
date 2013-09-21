class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
    	t.string :year
    	t.integer :number_of_games_played_per_team
    	t.integer :total_number_of_games
    	t.integer :number_of_teams

      t.timestamps
    end
  end
end

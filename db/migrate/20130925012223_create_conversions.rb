class CreateConversions < ActiveRecord::Migration
  def change
    create_table :conversions do |t|
      t.string :year
      t.string :player_name
      t.float :field_goals_made
      t.float :field_goals_attempted
      t.float :three_pointers_made
      t.float :three_pointers_attempted
      t.float :free_throws_made
      t.float :free_throws_attempted
      t.float :offensive_rebounds
      t.float :defensive_rebounds
      t.float :total_rebounds
      t.float :assists
      t.float :steals
      t.float :blocks
      t.float :turnovers
      t.float :points_scored
      t.float :true_point_value

      t.references :stat
      
      t.timestamps
    end
  end
end

class CreateRatios < ActiveRecord::Migration
  def change
    create_table :ratios do |t|
      t.string :year
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

      t.references :season

      t.timestamps
    end
  end
end

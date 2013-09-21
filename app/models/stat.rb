class Stat < ActiveRecord::Base
  belongs_to :season
  belongs_to :player

  def field_goal_percentage
		field_goals_made / field_goals_attempted.to_f * 100
	end

	def free_throw_percentage
		free_throws_made / free_throws_attempted.to_f * 100
	end

	def three_pointer_percentage
		three_pointers_made / three_pointers_attempted.to_f * 100
	end

		# "field_goals_made",
		# "field_goals_attempted",
		# "free_throws_made",
		# "free_throws_attempted",
		# "three_pointers_made",
		# "three_pointers_attempted",
		# "offensive_rebounds",
		# "defensive_rebounds",
		# "assists",
		# "steals",
		# "blocks",
		# "points_scored",
		# "turnovers"

	def true_point_value
		total = 0
		total += points_scored
		total += field_goals_made * season.field_goals_made_point_value
		total -= field_goals_attempted * season.field_goals_attempted_point_value
		total += free_throws_made * season.free_throws_made_point_value
		total -= free_throws_attempted * season.free_throws_attempted_point_value
		total += three_pointers_made * season.three_pointers_made_point_value
		total += assists * season.assists_point_value
		total += total_rebounds * season.total_rebounds_point_value
		total += steals * season.steals_point_value
		total += blocks * season.blocks_point_value
		total -= turnovers * season.turnovers_point_value
		total
	end

end

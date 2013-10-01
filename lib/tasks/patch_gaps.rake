namespace :patch_gaps do

	desc 'fills in games played per team and total number of games played'
	task :season => :environment do
		Season.all.each do |season|
			puts season.year
			number_of_teams = season.records.size
			number_of_games_played_per_team = season.records.first.games_played

			season.number_of_teams = number_of_teams
			season.number_of_games_played_per_team = number_of_games_played_per_team
			season.total_number_of_games = number_of_teams * number_of_games_played_per_team / 2
			season.save!

			ratio = Ratio.new
			ratio.year = season.year
			ratio.points_scored = season.points_scored_point_value
			ratio.field_goals_made = season.field_goals_made_point_value
			ratio.field_goals_attempted = season.field_goals_attempted_point_value
			ratio.free_throws_made = season.free_throws_made_point_value
			ratio.free_throws_attempted = season.free_throws_attempted_point_value
			ratio.three_pointers_made = season.three_pointers_made_point_value
			ratio.offensive_rebounds = season.offensive_rebounds_point_value
			ratio.defensive_rebounds = season.defensive_rebounds_point_value
			ratio.total_rebounds = season.total_rebounds_point_value
			ratio.assists = season.assists_point_value
			ratio.steals = season.steals_point_value
			ratio.blocks = season.blocks_point_value
			ratio.turnovers = season.turnovers_point_value
			ratio.season = season
			ratio.save!

		end
	end

	desc 'fills in true point value for each stat'
	task :stat => :environment do
		stats = Stat.all

		stats.each do |stat|
			puts stat.id
			conversion = Conversion.new
			conversion.year = stat.season.year
			conversion.player_name = stat.player_name
			conversion.field_goals_made = stat.season.ratio.field_goals_made * stat.field_goals_made
			conversion.field_goals_attempted = stat.season.ratio.field_goals_attempted * stat.field_goals_attempted
			conversion.free_throws_made = stat.season.ratio.free_throws_made * stat.free_throws_made
			conversion.free_throws_attempted = stat.season.ratio.free_throws_attempted * stat.free_throws_attempted
			conversion.three_pointers_made = stat.season.ratio.three_pointers_made * stat.three_pointers_made
			conversion.offensive_rebounds = stat.season.ratio.offensive_rebounds * stat.offensive_rebounds
			conversion.defensive_rebounds = stat.season.ratio.defensive_rebounds * stat.defensive_rebounds
			conversion.total_rebounds = stat.season.ratio.total_rebounds * stat.total_rebounds
			conversion.assists = stat.season.ratio.assists * stat.assists
			conversion.steals = stat.season.ratio.steals * stat.steals
			conversion.blocks = stat.season.ratio.blocks * stat.blocks
			conversion.turnovers = stat.season.ratio.turnovers * stat.turnovers
			conversion.points_scored = stat.points_scored
			conversion.save!

			stat.conversion = conversion
			stat.save!

			total = 0
			total += conversion.points_scored
			total += conversion.field_goals_made
			total -= conversion.field_goals_attempted
			total += conversion.free_throws_made
			total -= conversion.free_throws_attempted
			total += conversion.three_pointers_made
			total += conversion.assists
			total += conversion.steals
			total += conversion.blocks
			total += conversion.total_rebounds
			total -= conversion.turnovers

			conversion.true_point_value =	total
			conversion.save!
		end
	end


end


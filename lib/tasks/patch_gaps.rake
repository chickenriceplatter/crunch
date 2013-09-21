namespace :patch_gaps do

	desc 'fills in games played per team and total number of games played'
	task :season => :environment do
		Season.all.each do |season|
			number_of_teams = season.records.size
			number_of_games_played_per_team = season.records.first.games_played

			season.number_of_teams = number_of_teams
			season.number_of_games_played_per_team = number_of_games_played_per_team
			season.total_number_of_games = number_of_teams * number_of_games_played_per_team / 2
			season.save!
		end
	end

end


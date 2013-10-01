require 'csv'

namespace :read_csv do

	desc 'read in total team stats season by season'
	task :team => :environment do

		(1979..2012).each do |year|

			puts year

			season = Season.create(:year => "#{year}-#{year+1}")

			table = CSV.read("/Users/dave/sports_data/nba_team_stats/#{year}-#{year+1}.txt", headers: true, header_converters: :symbol)

			table.each do |row|
				team_name = row[:team].gsub("*", "")
				team = Team.where(:name => team_name).first_or_create

				record = Record.new
				record.team_name = row[:team]
				record.games_played = row[:g].to_i
				record.minutes_played = row[:mp].to_i
				record.field_goals_made = row[:fg].to_i
				record.field_goals_attempted = row[:fga].to_i
				record.three_pointers_made = row[:'3p'].to_i
				record.three_pointers_attempted = row[:'3pa'].to_i
				record.free_throws_made = row[:ft].to_i
				record.free_throws_attempted = row[:fta].to_i
				record.offensive_rebounds = row[:orb].to_i
				record.defensive_rebounds = row[:drb].to_i
				record.total_rebounds = row[:trb].to_i
				record.assists = row[:ast].to_i
				record.steals = row[:stl].to_i
				record.blocks = row[:blk].to_i
				record.turnovers = row[:tov].to_i
				record.personal_fouls = row[:pf].to_i
				record.points_scored = row[:pts].to_i
				record.save

				team.records << record
				team.save

				season.teams << team
				season.records << record
				season.save
			end
		end
	end

	desc 'read in player stats season by season'
	task :player => :environment do

		(1979..2012).each do |year|

			puts year

			season = Season.where(:year => "#{year}-#{year+1}").first

			table = CSV.read("/Users/dave/sports_data/nba_player_stats/#{year}-#{year+1}p.txt", headers: true, header_converters: :symbol)

			table.each do |row|
				player_name = row[:player].gsub("*", "")
				player = Player.where(:full_name => player_name).first_or_create

				stat = Stat.new
				stat.player_name = row[:player]
				stat.age = row[:age]
				stat.games_played = row[:g].to_i
				stat.games_started = row[:gs].to_i
				stat.minutes_played = row[:mp].to_i
				stat.field_goals_made = row[:fg].to_i
				stat.field_goals_attempted = row[:fga].to_i
				stat.three_pointers_made = row[:'3p'].to_i
				stat.three_pointers_attempted = row[:'3pa'].to_i
				stat.free_throws_made = row[:ft].to_i
				stat.free_throws_attempted = row[:fta].to_i
				stat.offensive_rebounds = row[:orb].to_i
				stat.defensive_rebounds = row[:drb].to_i
				stat.total_rebounds = row[:trb].to_i
				stat.assists = row[:ast].to_i
				stat.steals = row[:stl].to_i
				stat.blocks = row[:blk].to_i
				stat.turnovers = row[:tov].to_i
				stat.personal_fouls = row[:pf].to_i
				stat.points_scored = row[:pts].to_i
				stat.save

				player.stats << stat
				player.save

				season.players << player
				season.stats << stat
				season.save
			end

		end
	end

end

class Season < ActiveRecord::Base
	has_one :ratio
  has_many :records
  has_many :stats
	has_many :memberships
	has_many :participations
	has_many :teams, :through => :memberships
	has_many :players, :through => :participations

	def total_rebounds
		records.sum(&:total_rebounds)
	end

	def field_goal_percentage
		records.sum(&:field_goals_made) / records.sum(&:field_goals_attempted).to_f * 100
	end

	def free_throw_percentage
		records.sum(&:free_throws_made) / records.sum(&:free_throws_attempted).to_f * 100
	end

	def three_point_percentage
		records.sum(&:three_pointers_made) / records.sum(&:three_pointers_attempted).to_f * 100
	end

	def self.create_total_method(stat)
		define_method("total_#{stat}") {
		records.sum(&stat)
	}
	end

	stats = [
		"field_goals_made",
		"field_goals_attempted",
		"free_throws_made",
		"free_throws_attempted",
		"three_pointers_made",
		"three_pointers_attempted",
		"offensive_rebounds",
		"defensive_rebounds",
		"assists",
		"steals",
		"blocks",
		"points_scored",
		"turnovers",
		"personal_fouls"
	]

	def self.create_point_value_method(stat)
		define_method("#{stat}_point_value"){
			records.sum(&:points_scored) / records.sum(&stat).to_f
		}
	end

	stats.each do |statistic|
		Season.create_total_method(statistic.to_sym)
		Season.create_point_value_method(statistic.to_sym)
	end

	def total_rebounds_point_value
		total_points_scored.to_f / total_rebounds
	end

	def points_per_game
		total_points_scored / total_number_of_games.to_f / 2
	end

	def threes_attempted_per_game
		total_three_pointers_attempted / total_number_of_games.to_f / 2
	end



	# def method_missing(method)
	# 	relevant_part = method[6..method.size].to_sym
	# 	if records.first.methods.include?(relevant_part)
	# 		records.sum(&relevant_part)
	# 	else
	# 		super
	# 	end
	# end



end

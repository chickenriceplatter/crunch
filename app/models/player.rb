class Player < ActiveRecord::Base
  has_many :stats
  has_many :participations
  has_many :seasons, :through => :participations

  def total_rebounds
		stats.sum(&:total_rebounds)
	end

	def field_goal_percentage
		stats.sum(&:field_goals_made) / stats.sum(&:field_goals_attempted).to_f * 100
	end

	def free_throw_percentage
		stats.sum(&:free_throws_made) / stats.sum(&:free_throws_attempted).to_f * 100
	end

	def three_point_percentage
		stats.sum(&:three_pointers_made) / stats.sum(&:three_pointers_attempted).to_f * 100
	end

	def self.create_total_method(s)
		define_method("total_#{s}") {
		stats.sum(&s)
	}
	end

	statistics = [
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

	statistics.each do |s|
		Player.create_total_method(s.to_sym)
	end

end

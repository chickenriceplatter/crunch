class Record < ActiveRecord::Base
  belongs_to :season
	belongs_to :team

	def field_goal_percentage
		field_goals_made / field_goals_attempted.to_f * 100
	end

	def free_throw_percentage
		free_throws_made / free_throws_attempted.to_f * 100
	end

	def three_pointer_percentage
		three_pointers_made / three_pointers_attempted.to_f * 100
	end
	
end

class Team < ActiveRecord::Base
  has_many :records
	has_many :memberships
	has_many :seasons, :through => :memberships
end

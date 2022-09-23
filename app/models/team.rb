class Team < ApplicationRecord
  validates :team_name, :affiliation, presence: true
  validates :work, inclusion: {in: [true, false]}
  has_many :schedules
end

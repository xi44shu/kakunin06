class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_zone
  belongs_to :user
  belongs_to :team
  belongs_to :size
  belongs_to :accuracy
  belongs_to :first_contact
  belongs_to :mie
end

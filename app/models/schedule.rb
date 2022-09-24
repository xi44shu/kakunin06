class Schedule < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_zone
  belongs_to :user
  belongs_to :team
  belongs_to :size
  belongs_to :accuracy
  belongs_to :first_contact
  belongs_to :mie

  with_options presence: true do
    validates :scheduled_date, uniqueness: { scope: [:time_zone_id, :team_id], message: "は既に埋まっています" }
    validates :time_zone_id, :size_id, :accuracy_id, :first_contact_id,
    numericality: { other_than: 1, message: " can't be blank" }
    validates :mie_id, {numericality: true}
  end

end

class Accuracy < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '仮予約' },
    { id: 3, name: '本予約' },
    { id: 4, name: 'その他' }
  ]

  # include ActiveHash::Associations
  # has_many :schedules

end
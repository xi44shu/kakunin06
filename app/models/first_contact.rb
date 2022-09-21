class FirstContact < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '商社' },
    { id: 3, name: '営業' },
    { id: 4, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :schedules

end
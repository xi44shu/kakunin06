class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '小' },
    { id: 3, name: '中' },
    { id: 4, name: '大' },
    { id: 5, name: 'その他' },
  ]

  # include ActiveHash::Associations
  # has_many :schedules

end
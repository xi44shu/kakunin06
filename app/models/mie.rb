class Mie < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '伊賀' },
    { id: 3, name: '伊勢' },
    { id: 4, name: 'いなべ' },
    { id: 5, name: '尾鷲' },
    { id: 6, name: '亀山' },
    { id: 7, name: '熊野' },
    { id: 8, name: '桑名' },
    { id: 9, name: '志摩' },
    { id: 10, name: '鈴鹿' },
    { id: 11, name: '津' },
    { id: 12, name: '鳥羽' },
    { id: 13, name: '名張' },
    { id: 14, name: '松坂' },
    { id: 15, name: '四日市' },
  ]

  # include ActiveHash::Associations
  # has_many :schedules

end
class MinimumPeriod < ActiveHash::Base
  self.data = [
    {id: 1, name: '選択してください'},
    {id: 2, name: '5日間'},
    {id: 3, name: '10日間'},
    {id: 4, name: '15日間'},
    {id: 5, name: '20日間'},
    {id: 6, name: '25日間'},
    {id: 7, name: '30日間'}
  ]

  include ActiveHash::Associations
  has_many :items

end
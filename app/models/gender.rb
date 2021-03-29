class Gender < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: 'メンズ'},
    {id: 3, name: 'レディース'},
    {id: 4, name: 'キッズ'},
    {id: 5, name: '男女兼用'}
  ]

  include ActiveHash::Associations
  has_many :items

end
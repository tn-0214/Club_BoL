class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ドライバー' },
    { id: 2, name: 'フェアウェイウッド' },
    { id: 3, name: 'ユーティリティ' },
    { id: 4, name: 'アイアン' },
    { id: 5, name: 'ウェッジ' },
    { id: 6, name: 'パター' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
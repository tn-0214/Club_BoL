class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_many :categorys, through
  belongs_to :receiving_prefecture
  belongs_to :lending_period
  belongs_to :gender

end

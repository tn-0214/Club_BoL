class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_many :item_categories
  has_many :categories, through: :item_categories
  belongs_to :gender
  has_one :order
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  belongs_to :gender
  has_one :order
end


# with_options presence:true, numericality: { other_than: 1 } do
#  validates :
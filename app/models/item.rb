class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  belongs_to :gender
  has_one :order


  with_options presence:true, numericality: { other_than: 1 } do
    validates :gender_id
    validates :minimum_period
  end

  with_options presence:true do
    validates :name
    validates :comment
    validates :precaution
    validates :due_date
    validates :daily_price
    validates :category_ids
  end

end
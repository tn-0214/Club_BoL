class Order < ApplicationRecord
  belongs_to :item

  validates :lending_period,  presence: true, numericality: { only_integer: true,message:'半角数字を使用してください' }
end
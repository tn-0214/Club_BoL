class Order < ApplicationRecord
  attr_accessor :token

  belongs_to :item
  belongs_to :user

  validates :lending_period,  presence: true, numericality: { only_integer: true,message:'半角数字を使用してください' }

end
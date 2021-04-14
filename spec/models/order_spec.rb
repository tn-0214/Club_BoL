require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "#create" do
   before do
    @order = FactoryBot.build(:order)
  end

  context '購入成功時' do
    
    it 'lending_periodが入力されていれば購入できる' do
     expect(@order).to be_valid
    end

    it 'lending_periodが半角数字なら購入できる' do
     @order.lending_period = 7
     expect(@order).to be_valid
    end
    
  end

  context '購入失敗時' do

    it 'lending_periodが空では登録できない' do
     @order.lending_period = ""
     @order.valid?
     expect(@order.errors.full_messages).to include("Lending period can't be blank")
    end

    it 'lending_periodが全角では登録できない' do
      @order.lending_period = "あいう"
      @order.valid?
      expect(@order.errors.full_messages).to include("Lending period 半角数字を使用してください")
    end

    it 'lending_periodが英字では登録できない' do
      @order.lending_period = "ABC"
      @order.valid?
      expect(@order.errors.full_messages).to include("Lending period 半角数字を使用してください")
    end

  end

 end
end

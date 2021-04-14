require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
   before do
    user =  FactoryBot.create(:user)
    category =  FactoryBot.create(:category)
    @item = FactoryBot.build(:item, user_id: user.id, category_ids: category.id)
  end

  context '出品成功時' do

    it '全て規定通り入力されていれば出品できる' do
     expect(@item).to be_valid
    end

    it 'daily_priceが300円以上なら登録できること' do
      @item.daily_price = 300
      expect(@item).to be_valid
    end

  end

  context '出品失敗時' do

    it 'nameが空では登録できないこと' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'commentが空では登録できないこと' do
      @item.comment = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Comment can't be blank")
    end

    it 'precautionが空では登録できないこと' do
      @item.precaution = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Precaution can't be blank")
    end

    it 'gender_idが空では登録できないこと' do
      @item.gender_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Gender can't be blank")
    end

    it 'gender_idが1では登録できないこと' do
      @item.gender_id = 1
     @item.valid?
      expect(@item.errors.full_messages).to include("Gender must be other than 1")
    end

    it 'category_idsが空では登録できないこと' do
      @item.category_ids = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category ids can't be blank")
    end

    it 'due_dateが空では登録できないこと' do
      @item.due_date = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Due date can't be blank")
    end

    it 'minimum_periodが空では登録できないこと' do
      @item.minimum_period = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Minimum period can't be blank")
    end

     it 'minimum_periodが1では登録できないこと' do
      @item.minimum_period = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Minimum period must be other than 1")
    end

    it 'daily_priceが空では登録できないこと' do
      @item.daily_price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Daily price can't be blank")
    end

    it 'daily_priceが299円以下では登録できないこと' do
      @item.daily_price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Daily price 300円〜100000円の範囲で登録ください")
    end

    it 'daily_priceが100001円以上では登録できないこと' do
      @item.daily_price = 1000001
      @item.valid?
      expect(@item.errors.full_messages).to include("Daily price 300円〜100000円の範囲で登録ください")
    end

    it 'daily_priceに全角を含むと登録できないこと' do
      @item.daily_price = '300円'
      @item.valid?
      expect(@item.errors.full_messages).to include("Daily price 半角数字を使用してください")
    end

    it 'daily_priceに英字を含むと登録できないこと' do
      @item.daily_price = "300en"
      @item.valid?
      expect(@item.errors.full_messages).to include("Daily price 半角数字を使用してください")
    end


   end
 end
end
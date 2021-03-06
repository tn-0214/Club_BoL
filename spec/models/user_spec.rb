require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
   before do
    @user = FactoryBot.build(:user)
  end

  context '登録成功時' do
    it 'nickname~address_cityまで入力されていれば登録できる' do
      expect(@user).to be_valid
    end

    it 'passwordが英数字を含む6文字以上であれば登録できること' do
      @user.password = 'abc456'
      @user.password_confirmation = 'abc456'
      expect(@user).to be_valid
    end

    it 'phone_numberが12桁の数字なら登録できること' do
      @user.phone_number = '09000000000'
      expect(@user).to be_valid
    end

    it 'postcodeが7桁の数字なら登録できること' do
      @user.postcode = '2390808'
      expect(@user).to be_valid
    end

  end

  context 'エラー発生時' do
    it 'nicknameが空では登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが英字のみでは登録できないこと' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください。")
    end

    it 'passwordが数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください。")
    end

    it 'passwordに全角が含まれると登録できないこと' do
      @user.password = 'あいうab12'
      @user.password_confirmation = 'あいうab12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password 英字と数字の両方を含めて設定してください。")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailに@が含まれていないと登録できないこと' do
      @user.email = 'nothing.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが半角を含むと登録できないこと' do
      @user.last_name = '山田1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it 'first_nameが半角を含むと登録できないこと' do
      @user.first_name = '太郎a'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'phone_numberが空では登録できないこと' do
      @user.phone_number = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberに全角が入っていると登録できないこと' do
      @user.phone_number = 'あ9000000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number 11桁の半角数字で入力してください")
    end

    it 'phone_numberに英字が入っていると登録できないこと' do
      @user.phone_number = 'A9000000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number 11桁の半角数字で入力してください") 
    end

    it 'phone_numberに12桁未満の数字だと登録できないこと' do
      @user.phone_number = '0900000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Phone number 11桁の半角数字で入力してください")  
    end

    it 'postcodeが空では登録できないこと' do
      @user.postcode = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Postcode can't be blank")
    end

    it 'postcodeに全角が入っていると登録できないこと' do
      @user.postcode = 'あ390808'
      @user.valid?
      expect(@user.errors.full_messages).to include("Postcode 7桁の数字を入力してください(ハイフン不要)")
    end

    it 'phone_numberに英字が入っていると登録できないこと' do
      @user.postcode = 'A390808'
      @user.valid?
      expect(@user.errors.full_messages).to include("Postcode 7桁の数字を入力してください(ハイフン不要)") 
    end

    it 'phone_numberに12桁未満の数字だと登録できないこと' do
      @user.postcode = '390808'
      @user.valid?
      expect(@user.errors.full_messages).to include("Postcode 7桁の数字を入力してください(ハイフン不要)")  
    end

    it 'prefecture_codeが空だと登録できないこと' do
      @user.prefecture_code = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Prefecture code can't be blank")
    end

    it 'address_cityが空だと登録できないこと' do
      @user.address_city = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Address city can't be blank")
    end


  end

 end
end

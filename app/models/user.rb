class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  with_options presence:true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } 
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } 
    validates :nickname
    validates :email
    validates :birthday
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "11桁の半角数字で入力してください"}
    validates :postcode, format: {with: /\A\d{7}\z/, message: "7桁の数字を入力してください(ハイフン不要)"}
    validates :prefecture_code, numericality: { other_than: 1 }
    validates :address_city
  end

  validates :password, format:{ with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message:'英字と数字の両方を含めて設定してください。' }

  
end

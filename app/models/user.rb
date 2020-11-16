class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :nickname, presence: true
        validates :email, uniqueness: true
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
        
        validates :password, confirmation: true
        validates :password_confirmation, presence: true
        with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
        validates :first_name, presence: true
        validates :last_name, presence: true
        end
        with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カナを使用してください' } do
        validates :first_name_kana, presence: true
        validates :last_name_kana, presence: true
        end
        validates :birthday, presence: true

        has_many :items
        has_many :purchase_records
end

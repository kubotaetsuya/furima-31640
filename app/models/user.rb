class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         

         validates :nickname, presence: true
         validates :email, presence: true
         validates :email, uniqueness: true
         validates :email, inclusion: { in: %w(@),
          message: "%{value} エラー時のメッセージ" }
         validates :encrypted_password, presence: true
         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :last_name_kana, presence: true
         validates :first_name_kana, presence: true
         validates :birthday, presence: true

         has_many :items
         has_many :purchase_records
end

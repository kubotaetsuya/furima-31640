class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  validates :price, format: {with:/\A[0-9]+\z/}
  validates :image, presence :true
end

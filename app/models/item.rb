class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee_burden
  belongs_to :shipping_area
  belongs_to :days_ship

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_burden_id
    validates :shipping_area_id
    validates :days_ship_id
  end
  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end
end

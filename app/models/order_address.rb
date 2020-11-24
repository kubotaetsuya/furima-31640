class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :shipping_area_id, :city, :block, :building, :phone_number, :user, :item, :token

  with_options presence: true do
    validates :postcode
    validates :shipping_area_id
    validates :city
    validates :block
    validates :phone_number
    validates :token
  end

  validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :phone_number, format: {with: /\A\d{11}\z/ }
  validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :shipping_area_id, numericality: { other_than: 1 }

  def save
    order = Order.create(user_id: user, item_id: item.id)
    
    Address.create(postcode: postcode, shipping_area_id: shipping_area_id, city: city, block: block, building: building, phone_number: phone_number, order_id: order.id)
  end
end
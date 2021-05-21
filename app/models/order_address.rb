class OrderAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :city, :house_number, :building_name, :telephone_number, :user_id, :item_id,
                :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code
    validates :city
    validates :house_number
    validates :telephone_number
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Should be less than 11 half-width English numbers' }
  end

  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, shipping_area_id: shipping_area_id, city: city,
                   house_number: house_number, building_name: building_name, telephone_number: telephone_number)
  end
end

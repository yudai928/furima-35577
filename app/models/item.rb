class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_rate
  belongs_to :shipping_area
  #belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :price
    validates :description
  end

    
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_rate_id
    validates :shipping_day_id
  end

    validates :shipping_area_id, numericality: { other_than: 0 }
end

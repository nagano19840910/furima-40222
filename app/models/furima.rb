class Furima < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  validates :category_id, numericality: { other_than: 1 }
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :shipping_burden_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :product_name, presence: true, length: { maximum: 40 }
  validates :product_description, presence: true, length: { maximum: 1000 }
  validates :image, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_burden
  belongs_to :shipping_day
  belongs_to :prefecture
 end
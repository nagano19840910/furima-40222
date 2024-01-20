class Product < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :products, presence: true
end

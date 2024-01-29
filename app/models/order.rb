class Order
  include ActiveModel::Model 
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number, :user_id, :orde_id, :token, :furima_id
  
  with_options presence: true do
    validates :post_code, format: {with:/\A[0-9]{3}-[0-9]{4}\z/, message: "例)123-4567"}
    validates :prefecture_id, numericality:{other_than: 1, message: "can't be blank"}
    validates :municipalities, presence: true
    validates :street_address, presence: true
    validates :phone_number, format: { with: /\d{10,11}/, message: "should be 10 or 11 digits" }
    #validates :token
    validates :user_id
  end

  def save
    purchase = Purchase.create(user_id:user_id, furima_id:furima_id)
    ShippingAddress.create(post_code:post_code, prefecture_id:prefecture_id, municipalities:municipalities,street_address:street_address, building_name:building_name, phone_number:phone_number,purchase_id:purchase.id)
  end
end
    

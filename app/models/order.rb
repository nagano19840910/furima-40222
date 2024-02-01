class Order
  include ActiveModel::Model 
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number, :user_id, :token, :furima_id,
  with_options presence: true do
    validates :post_code, format: {with:/\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid.Enter it as follows (e.g. 123-4567)"}
    validates :municipalities
    validates :street_address
    validates :user_id
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "is invalid. Input only number" }
    validates :token
    validates :furima_id
  end
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}




  def save
    purchase = Purchase.create(user_id:user_id, furima_id:furima_id)
    ShippingAddress.create(post_code:post_code, prefecture_id:prefecture_id, municipalities:municipalities,street_address:street_address, building_name:building_name, phone_number:phone_number,purchase_id:purchase.id)
  end
end  


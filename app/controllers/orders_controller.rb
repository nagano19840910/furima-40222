class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [ :index]
  before_action :set_furima, only: [:index]



  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = Order.new
    if @furima.user.id == current_user.id || @furima.purchase.present?
      redirect_to root_path
    end
  end

  def create
    @furima = Furima.find(params[:furima_id])
    @order = Order.new(order_params)


    if @order.valid?
      pay_item

      @order.save
      return redirect_to root_path, notice: '購入が完了しました。'
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]


    flash.now[:alert] = @order.errors.full_messages.join(', ')
    render 'index', status: :unprocessable_entity
    end
  end

  private


  def set_furima
    @furima = Furima.find(params[:furima_id])
  end

  def check_seller
    if current_user == @furima.user
      redirect_to root_path, alert: '自身が出品した商品の購入はできません。'
    end
  end

  def order_params
    params.require(:order).permit(
      :post_code,
      :prefecture_id,
      :municipalities,
      :street_address,
      :building_name,
      :phone_number,
      :price,
      ).merge(
        token: params[:token],
        user_id: current_user.id,
        furima_id: (@furima.present? && @furima.id.present?) ? @furima.id : nil  
      )
    end
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @furima.price,  # 商品の値段
     card: order_params[:token],    # カードトークン
     currency: 'jpy'                 # 通貨の種類（日本円）
   )
end
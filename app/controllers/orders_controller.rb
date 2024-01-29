class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:purchase]
  before_action :set_item, only: [:show, :purchase]
  before_action :check_seller, only: [:purchase]



  def index
    # フォームオブジェクト（Order）の新しいインスタンスを生成
    @furima = Furima.find(params[:furima_id])
    @order = Order.new
  end

  def create
    # フォームオブジェクト（Order）の新しいインスタンスを生成し、フォームからのデータを渡す
    @furima = Furima.find(params[:furima_id])
    @order = Order.new(order_params)

    if @order.valid?
      # フォームデータが有効な場合はデータベースに保存
      @order.save
      # 保存が成功した場合のリダイレクトなど、適切な処理を実行
      redirect_to root_path, notice: '購入が完了しました。'
    else
      # フォームデータが無効な場合の処理（例: エラーメッセージを表示するビューを描画）
      render 'index'
    end
  end

  def purchase
    # 購入の実際の処理を記述（例: カードの認証、注文の確定など）
    # ...

    # 購入が完了した場合、適切なリダイレクトやメッセージを表示
    redirect_to root_path, notice: '購入が完了しました。'
  end


  private

  def set_furima
    @furima = Furima.find(params[:furima_id])
  end

  def check_seller
    if current_user == @item.user
      redirect_to root_path, alert: '自身が出品した商品の購入はできません。'
    end
  end


  private

  # ストロングパラメーターで許可するフォームデータのキーを指定
  def order_params
    params.require(:order).permit(
      :post_code,
      :prefecture_id,
      :municipalities,
      :street_address,
      :building_name,
      :phone_number,
      :furima_id,
      #:token
      ).merge(user_id: current_user.id, furima_id: @furima.id)
  end
end
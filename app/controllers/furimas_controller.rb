class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @furimas = Furima.order(created_at: :desc)
    # @furimas == [ ]
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    furima = Furima.find(params[:id])
    furima.destroy
    redirect_to root_path
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  private
  def furima_params
    params.require(:furima).permit(:image, :category_id, :product_condition_id, :shipping_burden_id, :shipping_day_id, :prefecture_id, :product_name, :product_description, :price).merge(user_id: current_user.id)
  end

end


class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_furima, only: [:edit, :update, :show, :destroy]
  before_action :require_login, only: [:edit, :update]
  before_action :authorize_user, only: [:destroy]

  def index
    @furimas = Furima.order(created_at: :desc)
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

  def show
  end

  def edit
    redirect_to root_path unless @furima.user == current_user
  end

  def update
  if @furima.update(furima_params)
    redirect_to furima_path(@furima), notice: '商品情報が更新されました。'
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
if @furima.destroy
  redirect_to root_path
else
  redirect_to root_path 
end
end


  private

  def set_furima
    @furima = Furima.find(params[:id])
  end

  def authorize_user
    redirect_to root_path, alert: '権限がありません。' unless @furima.user == current_user
  end
 
  def furima_params
    params.require(:furima).permit(:image, :category_id, :product_condition_id, :shipping_burden_id, :shipping_day_id, :prefecture_id, :product_name, :product_description, :price).merge(user_id: current_user.id)
  end
end

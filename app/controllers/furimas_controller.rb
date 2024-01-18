class FurimasController < ApplicationController
  def index
    @furimas = Furima.all
  end

  def new
    @furimas = Furima.new
  end

  def create
    Furima.create(furima_params)
    redirect_to '/'
  end

  def destroy
    furima = Furima.find(params[:id])
    furima.destroy
    redirect_to root_path
  end

  private
  def furima_params
    params.require(:furima).permit(:name, :image, :text)
  end

end


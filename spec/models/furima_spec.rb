require 'rails_helper'

RSpec.describe Furima, type: :model do
  before do
    @furima = FactoryBot.build(:furima)
end

describe '商品出品機能' do
  context"商品を出品できる場合" do
    it '商品を出品できる' do
      expect(@furima).to be_valid
    end
  end
end

  context"商品を出品できない場合" do
    it '画像が空では登録できない' do
      @furima.image = nil
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が空では登録できない' do
      @furima.product_name = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Product name can't be blank"
    end
    it '商品の説明が空では登録できない' do
      @furima.product_description = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Product description can't be blank"
    end
    it 'カテゴリーが空では登録できない' do
      @furima.category_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Category must be other than 1"
    end
    it '商品の状態が空では登録できない' do
      @furima.product_condition_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Product condition must be other than 1"
    end
    it '配送料の負担が空では登録できない' do
      @furima.shipping_burden_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Shipping burden must be other than 1"
    end 
    it '発送元の地域が空では登録できない' do
      @furima.prefecture_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Prefecture must be other than 1"
    end
    it '発送までの日数が空では登録できない' do
      @furima.shipping_day_id = 1
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Shipping day must be other than 1"
    end
    it '販売価格が空では登録できない' do
      @furima.price = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Price is not a number"
    end
    end      
  end
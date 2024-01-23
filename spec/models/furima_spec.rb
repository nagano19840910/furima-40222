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
      @furima.image = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が空では登録できない' do
      @furima.product_name = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Name can't be blank"
    end
    it '商品の説明が空では登録できない' do
      @furima.product_description = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Info can't be blank"
    end
    it 'カテゴリーが空では登録できない' do
      @furima.category = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態が空では登録できない' do
      @furima.product_condition = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Sales status can't be blank"
    end
    it '配送料の負担が空では登録できない' do
      @furima.shipping_burden = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Shipping fee status can't be blank"
    end
    it '発送元の地域が空では登録できない' do
      @furima.prefecture = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Prefecture can't be blank"
    end
    it '発送までの日数が空では登録できない' do
      @furima.shipping_day = ''
      @furima.valid?
      expect(@furima.errors.full_messages).to include "Scheduled delivery can't be blank"
    end
  end
end
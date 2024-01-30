require 'rails_helper'

RSpec.describe Order, type: :model do
describe '寄付情報の保存' do
  before do
    @user = FactoryBot.create(:user)
    @furima = FactoryBot.create(:furima, user_id: @user.id)
    @order = FactoryBot.build(:order, user_id: @user.id, furima_id: @furima.id)
    sleep 1 
  end
  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end
    it 'municipalitiesは空でも保存できること' do
      @order.municipalities = ''
      expect(@order).to be_valid
    end
    it 'street_addressは空でも保存できること' do
      @order.street_address = ''
      expect(@order).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @order.building_name = ''
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'post_codeが空だと保存できないこと' do
      @order.post_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @order.prefecture = 0
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'priceが空だと保存できないこと' do
      @order.price = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが全角数字だと保存できないこと' do
      @order.price = '２０００'
      @order.valid?
      expect(@order.errors.full_messages).to include('Price is invalid')
    end
    it 'priceが1円未満では保存できないこと' do
      @order.price = 0
      @order.valid?
      expect(@order.errors.full_messages).to include('Price is invalid')
    end
    it 'priceが1,000,000円を超過すると保存できないこと' do
      @order.price = 1000001
      @order.valid?
      expect(@order.errors.full_messages).to include('Price is invalid')
    end
    it 'userが紐付いていないと保存できないこと' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
  end
end
end

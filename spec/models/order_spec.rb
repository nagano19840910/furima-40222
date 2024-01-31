require 'rails_helper'

RSpec.describe Order, type: :model do
describe '寄付情報の保存' do
  before do
    @user = FactoryBot.create(:user)
    @furima = FactoryBot.create(:furima, user: @user)
    @order = FactoryBot.build(:order, user_id: @user.id, furima_id: @furima.id)
    sleep 1 
  end
  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end
    it 'building_nameは空でも保存できること' do
      @order.building_name = ''
      expect(@order).to be_valid
    end
    it "priceとtokenがあれば保存ができること" do
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
      @order.post_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Post code is invalid.Enter it as follows (e.g. 123-4567)')
    end
    it 'prefecture_idを選択していないと保存できないこと' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'userが紐付いていないと保存できないこと' do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'municipalitiesが空だと保存できないこと' do
      @order.municipalities = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipalities can't be blank")
    end
    it 'street_addressが空だと保存できないこと' do
      @order.street_address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Street address can't be blank")
    end
    it 'phone_numberが空だと保存できないこと' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid. Input only number")
    end
    it 'phone_numberが10桁未満だと保存できないこと' do
      @order.phone_number = 123456789
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid. Input only number")
    end
    it 'phone_numberが12桁以上だと保存できないこと' do
      @order.phone_number = 123456789123
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid. Input only number")
    end
    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    






  end
end
end

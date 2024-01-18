require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: '', email: 'test@example', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("password can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("first name can't be blank")
    end
    it 'birthdayが空では登録出来ない' 
    user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
    user.valid?
    expect(user.errors.full_messages).to include("birthday can't be blank") 
  end
    it 'last_name_huriganaが空では登録出来ない' do
      user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
      user.valid?
      expect(user.errors.full_messages).to include("last name hurigana can't be blank")
    end
    it 'first_name_huriganaが空では登録出来ない'
    user = User.new(nickname: 'test', email: '', password: '000000', password_confirmation: '000000')
    user.valid?
    expect(user.errors.full_messages).to include("first name hurigana can't be blank")
  end

  pending "add some examples to (or delete) #{__FILE__}"


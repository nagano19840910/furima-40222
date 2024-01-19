require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context"新規登録できる場合" do
      it '新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context"新規登録できない場合" do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'tajimagmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end


      it 'passwordが空では登録出来ない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '01234'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが英数字混合でないと場合登録できない（数字のみの場合）' do
        @user.password = '01234567'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it 'passwordが英数字混合でないと場合登録できない（英字のみの場合）' do
        @user.password = 'abcdefgh'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid. Include both letters and numbers"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '01234567p'
        @user.password_confirmation = '01234567u'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'last_nameが全角文字でないと登録できない' do
        @user.last_name = 'Smith'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'first_nameが全角文字でないと登録できない' do
        @user.first_name = 'Terry'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end
      it 'last_name_huriganaが空では登録できない' do
        @user.last_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name hurigana can't be blank"
      end
      it "last_name_huriganaが全角カタカナでないと登録できない" do
        @user.last_name_hurigana = "Smith"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name hurigana 全角カナ文字を使用してください"
      end
      it 'first_name_huriganaが空では登録できない' do
        @user.first_name_hurigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name hurigana can't be blank"
      end
      it 'first_name_huriganaが全角カタカナでないと登録できない' do
        @user.first_name_hurigana = 'Terry'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name hurigana 全角カナ文字を使用してください"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
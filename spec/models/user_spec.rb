require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録/ユーザー情報' do
    it '全ての情報が入っていれば登録できること' do
      expect(@user).to be_valid
    end

    it 'ニックネームが空の状態では保存できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが空の状態では保存できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it '同じメールアドレスは保存できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは＠がないと保存できない' do
      @user.email = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが空の状態では保存できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは６文字以上でないと保存できない' do
      @user.password = 'aa11'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは半角英数字混合でないと保存できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password は6文字以上かつ英数字をそれぞれ含めてください')
    end
    it 'passwordとpassword_confirmationは同じでないと保存できない' do
      @user.password = 'aaaaa1'
      @user.password_confirmation = 'aaa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'パスワード（確認用）が空だと保存できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  describe 'ユーザー新規登録/本人確認情報' do
    it 'ユーザー本名は名字と名前が空の状態だと保存できない' do
      if @user.last_name_kanji = '' || @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end
    end
    it 'ユーザーの本名は全角でないと保存できない' do
      @user.last_name_kanji = 'aaa' || @user.first_name_kanji = 'bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kanji に全角文字を使用してください')
    end
    it 'ユーザー本名のフリガナは名字と名前が空の状態だと保存できない' do
      @user.last_name_kana = '' || @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'ユーザー本名のフリガナは全角でないと保存できない' do
      @user.last_name_kana = 'aaa' || @user.first_name_kana = 'bbb'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana に全角文字を使用してください')
    end
    it '生年月日が空だと保存できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

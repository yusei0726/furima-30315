require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '正常に出品できる場合' do
    it '全ての情報が揃っていれば出品できる' do
      expect(@item).to be_valid
    end
  end
  describe '正常に出品できない場合' do
    it '商品画像が空では出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空では出品できない' do
      @item.title = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end
    it '商品の説明が空では出品できない' do
      @item.concept = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Concept can't be blank")
    end
    it 'カテゴリーの情報が空では出品できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーの情報が[---]では出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it '商品の状態についての情報が空では出品できない' do
      @item.product_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status can't be blank")
    end
    it '商品の状態についての情報が[---]では出品できない' do
      @item.product_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Product status must be other than 1")
    end
    it '配送料の負担についての情報が空では出品できない' do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end
    it '配送料の負担についての情報が[---]では出品できない' do
      @item.shipping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
    end
    it '発送元の地域についての情報が空では出品できない' do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '発送元の地域についての情報が[---]では出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it '発送までの日数についての情報が空では出品できない' do
      @item.shipping_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank")
    end
    it '発送までの日数についての情報が空では出品できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
    end
    it '価格についての情報が空では出品できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が、¥300以下であると出品できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end
    it '価格の範囲が、¥9,999,999以上であると出品できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than 10000000')
    end
    it '販売価格は半角英字では出品できない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '販売価格は半角英数では出品できない' do
      @item.price = 'aa3000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
    it '販売価格は全角数字では出品できない' do
      @item.price = '３０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end

require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '商品が購入できる場合' do
    it '必要な情報が全て揃っていれば商品が購入できること' do
      expect(@purchase_form).to be_valid
    end
    it '建物名が空の状態でも購入できること'do
      @purchase_form.building_name = nil
      expect(@purchase_form).to be_valid
    end
  end
  
  describe '商品が購入できない場合' do
    it '郵便番号が空の状態では購入できない' do
      @purchase_form.postal_code = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号はハイフンがない状態では購入できない' do
      @purchase_form.postal_code = '1234567'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Postal code is invalid")
    end
    it '郵便番号が7桁でない状態では購入できない' do
      @purchase_form.postal_code = '123-456'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Postal code is invalid")
    end
    it '都道府県が空の状態では購入できない' do
      @purchase_form.prefecture_id = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空の状態では購入できない' do
      @purchase_form.municiparity = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Municiparity can't be blank")
    end
    it '番地が空の状態では購入できない' do
      @purchase_form.house_number = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("House number can't be blank")
    end
    it '電話番号が空の状態では購入できない' do
      @purchase_form.phone_number = nil
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号はハイフンがある状態では購入できない' do
      @purchase_form.phone_number = '12-345-678'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が10桁か11桁でない状態では購入できない' do
      @purchase_form.phone_number = '1234567890123'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
    end
  end
end

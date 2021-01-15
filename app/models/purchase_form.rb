class PurchaseForm

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municiparity, :house_number, :building_name, :phone_number, :user_id, :item_id

  with_options precense: true do
    validates :municiparity
    validates :house_number
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :postal_code,   format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone_number,  format: { with: /\A\d{10,11}\z/}
  end
end
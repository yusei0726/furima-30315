class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charge
  belongs_to :shipping_day
  belongs_to :prefecture

  with_options presence: true do
    validates :title
    validates :concept
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_status_id
      validates :shipping_charge_id
      validates :shipping_day_id
      validates :prefecture_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 10_000_000 }, format: { with: /\A[0-9]+\z/, message: 'に半角数字を使用してください' } do
    end
  end  
end

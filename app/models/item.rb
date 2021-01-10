class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_status
  belongs_to :shipping_charge
  belongs_to :shipping_day
  belongs_to :prefecture

  validates :title,               presence: true
  validates :concept,             presence: true
  validates :category_id,         presence: true, numericality: { other_than: 1 } 
  validates :product_status_id,   presence: true, numericality: { other_than: 1 } 
  validates :shipping_charge_id,  presence: true, numericality: { other_than: 1 } 
  validates :shipping_day_id,     presence: true, numericality: { other_than: 1 } 
  validates :prefecture_id,       presence: true, numericality: { other_than: 1 } 
  validates :price,               presence: true, numericality: { greater_than_or_equal_to: 300,less_than: 10000000 }, format: { with: /\A[0-9]+\z/, message: 'に半角数字を使用してください'} do
  end
  validates :image,               presence: true

end

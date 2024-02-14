class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge_load
  belongs_to :prefecture
  belongs_to :number_of_day
  belongs_to :user
  validates  :image, :item_name, :item_explanation, :category, :condition, :delivery_charge_load, :prefecture, :number_of_day, presence: true
  validates  :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }

  has_one_attached :image

  validates :category_id,             numericality: { other_than: 1, message: "can't be blank" } 
  validates :condition_id,            numericality: { other_than: 1, message: "can't be blank" } 
  validates :delivery_charge_load_id, numericality: { other_than: 1, message: "can't be blank" } 
  validates :prefecture_id,           numericality: { other_than: 1, message: "can't be blank" } 
  validates :number_of_day_id,        numericality: { other_than: 1, message: "can't be blank" } 
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge_load
  belongs_to :prefecture
  belongs_to :number_of_day
  belongs_to :user
  validates  :image, :item_name, :item_explanation, presence: true
  validates  :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  has_one_attached :image

  validates :category_id,             presence: true
  validates :condition_id,            presence: true
  validates :delivery_charge_load_id, presence: true
  validates :prefecture_id,           presence: true
  validates :number_of_day_id,        presence: true
end

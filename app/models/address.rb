class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token
  belongs_to :prefecture
  validates  :post_code, :city, :street_address, :phone_number, presence: true
  validates  :token, presence: true
  attribute  :building_name, :string

  validates  :prefecture_id, presence: true
end

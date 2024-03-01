class Addresse < ApplicationRecord
  belongs_to :prefecture
  validates  :post_code, :city, :street_address, :phone_number, presence: true

  validates :prefecture_id, presence: true
end

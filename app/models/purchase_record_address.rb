class PurchaseRecordAddress
  extend ActiveHash::Associations::ActiveRecordExtensions
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id, :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, presence: true
    validates :city, :street_address, :phone_number, presence: true
    validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/}
    validates :token, presence: true
  end

  
  def save
  purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
  Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
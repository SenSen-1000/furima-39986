class PruchaseRecordAddress

  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :street_address, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id, :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
end

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end
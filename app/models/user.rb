class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :family_name,      presence: true, format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :first_name,       presence: true, format: {with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
  validates :read_family_name, presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :read_first_name,  presence: true, format: { with: /\A[ァ-ヶー]+\z/}
  validates :birth_date,       presence: true
  validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,

  has_namy :items
  },on: :create
end
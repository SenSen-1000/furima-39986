class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :family_name,      presence: true, format: {with:/[^\x01-\x7Eｦ-ﾟ]+/}
  validates :first_name,       presence: true, format: {with:/[^\x01-\x7Eｦ-ﾟ]+/}
  validates :read_family_name, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :read_first_name,  presence: true, format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :birth_date,       presence: true
  validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
  },on: :create
end
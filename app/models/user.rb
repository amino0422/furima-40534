class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :orders

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true, length: { maximum: 6 }
  validates :birth_date,      presence: true

  validates :password,        format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "is invalid. Include both letters and numbers and have at least 6 characters" }

  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input full-width characters" }
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input full-width characters" }

  validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters" }
end
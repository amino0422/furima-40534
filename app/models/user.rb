class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :nickname,        presence: true
  validates :birth_date,      presence: true

  # パスワードの形式のバリデーションを設定します。
  # ここでは、6文字以上の半角英数字が混合したものを条件とします。
  validates :password,        format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/, message: "is invalid. Include both letters and numbers" }

  # 全角ひらがな/カタカナ/漢字を許可するバリデーションを設定します。
  validates :last_name,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input full-width characters" }
  validates :first_name,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "is invalid. Input full-width characters" }

  # 全角カタカナのみを許可するバリデーションを設定します。
  validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: "is invalid. Input full-width katakana characters" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: "is invalid. Input full-width katakana characters" }

end
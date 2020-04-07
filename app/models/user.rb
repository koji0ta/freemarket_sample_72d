class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name, :last_kana, :first_kana, :birth, presence: true
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, 
                                            message: "全角で入力してください" }

  validates :last_kana, :first_kana, format: { with: /\A[ァ-ヶー－]+\z/ ,
                                            message: "全角カタカナで入力してください" }

  has_many :items, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_one :place, dependent: :destroy
  accepts_nested_attributes_for :place, allow_destroy: true
end

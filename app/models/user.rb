class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :nickname, :last_name, :first_name, :last_kana, :first_kana, :birth, presence: true
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, 
                                            message: "全角で入力してください" }

  validates :last_kana, :first_kana, format: { with: /\A[ァ-ヶー－]+\z/ ,
                                            message: "全角カタカナで入力してください" }

  has_many :items, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_one :place, dependent: :destroy
  accepts_nested_attributes_for :place, allow_destroy: true
  has_many :sns_credentials, dependent: :destroy

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end

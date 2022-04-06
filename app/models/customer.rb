class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  has_many :lessons, dependent: :destroy
  has_many :cart_lessons, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :have_lessons, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :payment_methods, dependent: :destroy

  validates :nickname, presence: true

  validates :is_deleted, inclusion: { in: [true, false] }

  attachment :image

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |customer|
      customer.nickname = auth.info.name
      customer.email = auth.info.email
      customer.password = Devise.friendly_token[0,20]
    end
  end
end

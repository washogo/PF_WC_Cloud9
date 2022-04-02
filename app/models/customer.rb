class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lessons, dependent: :destroy
  has_many :cart_lessons, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :have_lessons, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :payment_methods, dependent: :destroy

  with_options presence: true do
    # validates :last_name
    # validates :first_name
    # validates :last_name_kana
    # validates :first_name_kana
    # validates :postal_code
    # validates :address
    # validates :phone_number
    validates :nickname
  end

  with_options uniqueness: true do
    # validates :phone_number
    validates :nickname
  end

  validates :is_deleted, inclusion: { in: [true, false] }

  attachment :image

  # def full_name
  #   self.last_name + " " + self.first_name
  # end

  # def full_name_kana
  #   self.last_name_kana + " " + self.first_name_kana
  # end

  # def full_address
  #   self.postal_code + " " + self.address
  # end

end

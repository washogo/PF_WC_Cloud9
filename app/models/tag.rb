class Tag < ApplicationRecord
  has_many :tag_lists, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end

class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :customer

  has_many :tag_lists
  has_many :tags, through: :tag_lists
  has_many :evaluations
  has_many :cart_lessons
  has_many :order_details
  has_many :have_lessons

  enum attending_style: { online: 0, offline: 1 }

  with_options presence: true do
    validates :name
    validates :content
    validates :attending_style
    validates :contract_period
    validates :price
    validates :access
  end

  validates :attending_style, inclusion: { in: ["online", "offline"] }
  validates :is_in_lecture, inclusion: { in: [true, false] }

  with_options numericality: true do
    validates :contract_period
    validates :price
  end

  validate :transfer_target_presence, on: :create

  def transfer_target_presence
    if customer.transfer_target.blank?
      errors.add(:transfer_target, "の登録が必要です")
    end
  end

  def tax_price
    self.price * 1.1
  end


  def save_tag(made_tags)
    current_tags=self.tags.pluck(:name) unless self.tags.nil?
    old_tags=current_tags - made_tags
    new_tags=made_tags - current_tags

    old_tags.each do |old|
      old_tag=Tag.find_by(name: old)
      old_tag_list=TagList.find_by(tag_id: old_tag.id, lesson_id: self.id)
      
      if TagList.where(tag_id: old_tag.id).length > 1
        old_tag_list.delete
      else
        old_tag.delete
        old_tag_list.delete
      end
    end

    new_tags.each do |new|
      new_tag=Tag.find_or_create_by(name: new)
      self.tags << new_tag
    end
  end

  scope :search, -> (search_params) do
    return if search_params.blank?

    category_id(search_params[:category_id])
      .attending_style(search_params[:attending_style])
      .access(search_params[:access])
      .price(search_params[:price])
  end

  scope :category_id, -> (category_id) { where('category_id = ? ', category_id) if category_id.present? }
  scope :attending_style, -> (attending_style) { where('attending_style = ?', attending_style) if attending_style.present? }
  scope :access, -> (access) { where('access LIKE ?', "%#{access}%") if access.present? }
  scope :price, -> (price) { where('price <= ?', price) if price.present? }

end

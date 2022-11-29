class Profile < ApplicationRecord
  has_many :profile_attributes, dependent: :restrict_with_error

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, allow_blank: true, length: { maximum: 255 }
end

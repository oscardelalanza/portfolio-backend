class ProfileAttribute < ApplicationRecord
  belongs_to :profile

  validates :key, presence: true, length: { maximum: 20 }, format: /\A[a-zA-Z_]+\z/
  validates :value, presence: true
  validates :description, allow_blank: true, length: { maximum: 255 }
  validates :visible, inclusion: [true, false]

  def visible?
    visible
  end
end

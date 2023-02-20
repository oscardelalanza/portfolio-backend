class Product < ApplicationRecord
  validates :name, presence: true
  validates :brand, presence: true
  validates :content, presence: true, numericality: { only_integer: true }
  validates :units, presence: true
  validates :category, presence: true
  validates :sku, uniqueness: true, allow_blank: true
  validates :asin, uniqueness: true, allow_blank: true
end

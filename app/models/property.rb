class Property < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :rent, presence: true
  validates :address, presence: true
  validates :year, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end

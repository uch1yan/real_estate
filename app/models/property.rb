class Property < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :rent, presence: true
  validates :address, presence: true
  validates :year, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  has_many :nearest_stations, dependent: :destroy

  accepts_nested_attributes_for :nearest_stations, allow_destroy: true, reject_if: :all_blank
end

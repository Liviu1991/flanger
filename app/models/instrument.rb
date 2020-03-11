class Instrument < ApplicationRecord
  mount_uploader :image, ImageUploader
  serialize :image, JSON
  belongs_to :user, optional: true

  validates :title, :model, :brand, :price, presence: true
  validates :description, length: { maximum: 1000 }
  validates :title, length: { maximum: 140 }
  validates :price, numericality: { only_integer: true }

  BRAND = %w[Fender Gibson Martin Ibanez]
  FINISH = %w[Black White Navy Blue]
  CONDITION = %[New Excellent Mint Used]
end

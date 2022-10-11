class Api::V1::Frame < ApplicationRecord
  enum status: [:active, :inactive]

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :stock, presence: true
  validates :price, presence: true

  has_many :api_v1_glasses
end

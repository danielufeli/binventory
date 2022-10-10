class Api::V1::Lense < ApplicationRecord
  enum prescription_type: [:fashion, :single_vision, :varifocals]
  enum lens_type: [:classic, :blue_light, :transition]

  validates :colour, presence: true
  validates :description, presence: true
  validates :prescription_type, presence: true
  validates :lens_type, presence: true
  validates :stock, presence: true
  validates :price, presence: true
  
end

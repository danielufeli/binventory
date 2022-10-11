class Api::V1::CurrencyRate < ApplicationRecord
  validates :symbol, presence: true
  validates :rate, presence: true

  has_many :api_v1_glasses
end

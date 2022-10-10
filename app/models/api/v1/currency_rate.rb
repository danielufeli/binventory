class Api::V1::CurrencyRate < ApplicationRecord
  validates :symbol, presence: true
  validates :rate, presence: true
end

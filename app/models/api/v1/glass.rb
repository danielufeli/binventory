class Api::V1::Glass < ApplicationRecord
  belongs_to :user

  validates :total, presence: true
end

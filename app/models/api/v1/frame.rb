class Api::V1::Frame < ApplicationRecord
  enum status: [:active, :inactive]
end

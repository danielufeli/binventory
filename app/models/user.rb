class User < ApplicationRecord
  enum role: [:user, :admin]

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :validatable,
         jwt_revocation_strategy: JwtDenylist

  after_initialize :set_default_role, :if => :new_record?
  def set_default_role
    self.role ||= :user
  end
end
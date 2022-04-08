class Role < ApplicationRecord
  has_many :user_roles
  has_many :users, through: :user_roles

  before_save { |role| role.name = name.upcase }

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end

class User < ApplicationRecord
  has_secure_password
  has_secure_password :pincode, validations: false

  has_many :user_roles, dependent: :delete_all
  has_many :roles, through: :user_roles
  has_many :time_events, dependent: :delete_all

  validates :given_name, presence: true
  validates :surname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :pincode, presence: true, format: { with: /\A[0-9]{4,9}\z/ }

  def full_name
    "#{given_name} #{surname}"
  end

  def has_role?(requested_role)
    roles.one? { |r| r.name.downcase.to_sym.eql?(requested_role) }
  end
end

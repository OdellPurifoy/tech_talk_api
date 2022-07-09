# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # Relations 
  has_many :posts, dependent: :destroy

  # Presence Validations
  validates :first_name, :last_name, :email, :username, presence: true

  # Uniqueness Validations
  validates :email, :username, uniqueness: true

  # Length Validations
  validates :email, length: { maximum: 50 }
  validates :first_name, :last_name, length: { maximum: 25 }
  validates :username, length: { minimum: 4 }
end

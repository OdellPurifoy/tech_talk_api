# frozen_string_literal: true

class User < ApplicationRecord
  # Presence Validations
  validates :first_name, :last_name, :email, presence: true

  # Length Validations
  validates :first_name, :last_name, length: { maximum: 25 }
  validates :email, length: { maximum: 50 }

  # Relations 
  # has_many :posts, dependent: destroy
  has_many :posts
end

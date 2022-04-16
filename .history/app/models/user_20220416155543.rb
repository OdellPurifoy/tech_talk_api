# frozen_string_literal: true

class User < ApplicationRecord
  # Presence Validations
  validates :first_name, :last_name, :email, presence: true

  # Length Validations 
  validates :first_name, :last_name, length: { maximum: 25, too_long: '#{count} is the maximum allowed' }
  validates :email, length: { maximum: 50, too_long: '#{count} is the maximum allowed' } 
end
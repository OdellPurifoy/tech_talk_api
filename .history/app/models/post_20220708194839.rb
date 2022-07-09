# frozen_string_literal: true

class Post < ApplicationRecord
  # Relations
  # belongs_to :user

  # Presence validations
  validates_presence_of :title, :body

  # Length Validations
  validates :title, length: { maximum: 50 }
  validates :body, length: { maximum: 500 }
end

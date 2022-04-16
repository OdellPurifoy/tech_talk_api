class Post < ApplicationRecord
  # Presence validations
  validates :title, :body, presence: true

  # Length Validations 
  validates :title, length: { maximum: 50 }
  validates :body, length: { maximum: 500 }

  # Relations
  belongs_to :user
end

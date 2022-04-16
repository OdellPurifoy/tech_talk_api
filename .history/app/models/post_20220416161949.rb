class Post < ApplicationRecord
  # Presence validations
  validates :title, :body, presence: true

  # Length Validations 
  validates :first_name, :last_name, length: { maximum: 25 }
  validates :email, length: { maximum: 50 }

  # Relations
  belongs_to :user
end

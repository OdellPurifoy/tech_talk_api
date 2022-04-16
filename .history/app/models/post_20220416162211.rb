class Post < ApplicationRecord
  # Presence validations
  validates :title, :body, presence: true

  # Length Validations 
  validates :first_name, :last_name, length: { maximum: 50 }
  validates :email, length: { maximum: 500 }

  # Relations
  belongs_to :user
end

class User < ApplicationRecord
    # Presence Validations
    validates :first_name, :last_name, :email, presence: true
end

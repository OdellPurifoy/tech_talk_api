# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # Presence specs
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }

  # Length specs
  it { should validate_length_of(:first_name).is_at_most(25) }
  it { should validate_length_of(:last_name).is_at_most(25) }
  it { should validate_length_of(:email).is_at_most(50) }

  # Uniqueness specs
  it { should validate_uniqueness_of(:email) }

  # Relation specs
  it { should have_many(:posts) }
end
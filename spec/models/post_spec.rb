# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  # Presence specs
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  # Length specs
  it { should validate_length_of(:title).is_at_most(50) }
  it { should validate_length_of(:body).is_at_most(500) }

  # Relation specs
  it { should belong_to(:user) }
end

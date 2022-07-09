# frozen_string_literal: true

require 'rails_helper'

describe AuthenticationTokenService do
  describe '.call' do
    it 'returns an authentication token' do
      hmac_secret = 'my$ecretK3y'
      token = described_class.call

      decoded_token = JWT.decode token, described_class::HMAC_SECRET, true, { algorithm: 'HS256' }

      expect(decoded_token).to eq(
        [
          { 'data' => 'test' },
          { 'alg' => 'HS256' }

        ]
      )
    end
  end
end

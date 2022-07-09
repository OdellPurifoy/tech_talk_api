require 'rails_helper'

describe AuthenticationTokenService do
    describe '.call' do
        it 'returns an authentication token' do
            hmac_secret = 'my$ecretK3y'
            decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }

            expect(described_class.call).to eq('123')
        end
    end
end
require 'rails_helper'

describe AuthenticationTokenService do
    describe '.call' do
        it 'returns an authentication token' do
            hmac_secret = 'my$ecretK3y'
            token = described_class.call

            decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }

            expect(decoded_token).to eq(
                [
                      {"data"=>"test"}, # payload
                      {"alg"=>"HS256"} # header
                    
                ]
            )
        end
    end
end
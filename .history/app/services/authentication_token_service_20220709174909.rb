class AuthenticationTokenService
    HMAC_SECRET = 'my$ecretK3y'

    def self.call
        payload = { "data" => "test" }

        token = JWT.encode payload, HMAC_SECRET, 'HS256'
    end
end
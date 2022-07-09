class AuthenticationTokenService
    def self.call
        hmac_secret = 'my$ecretK3y'
        payload = { "test" => "run" }

        token = JWT.encode payload, hmac_secret, 'HS256'
    end
end
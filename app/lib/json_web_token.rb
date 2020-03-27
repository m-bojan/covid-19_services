# frozen_string_literal: true

class JsonWebToken
  # secret to encode and decode token
  HMAC_SECRET = "31e604e33c20b46c64146393ea1da8fc9a05bb39f32e58c56b17c1a7619c25b831e4715298db894037f02ab7ae742fab07c292a383af35f8dc819fc8f8bb5a5d"
  ALGORITHM   = 'HS256'

  # Encode and generate a token
  def self.encode(payload, exp = 24.hours.from_now)
    payload[:iat] = Time.zone.now.to_i
    payload[:exp] = exp.to_i

    JWT.encode(payload, HMAC_SECRET, ALGORITHM)
  end

  # Decode and validate the token
  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET, true, algorithm: ALGORITHM)[0]
    HashWithIndifferentAccess.new(body)
  end
end

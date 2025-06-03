class User < ApplicationRecord
  acts_as_authentic do |c|
    c.crypto_provider = ::Authlogic::CryptoProviders::SCrypt
  end
end
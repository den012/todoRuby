class User < ApplicationRecord
  acts_as_authentic do |c|
    c.crypto_provider = ::Authlogic::CryptoProviders::SCrypt
  end

  validates :email, uniqueness: { case_sensitive: false }

  #Associations
  has_many :todo_lists, dependent: :destroy
end
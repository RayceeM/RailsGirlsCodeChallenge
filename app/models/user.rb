class User < ApplicationRecord
  has_secure_password

  has_many :messages, foreign_key: :sender_id

end

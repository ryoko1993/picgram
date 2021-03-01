class User < ApplicationRecord  
    validates :name, presence: true, length: { maximum: 15 }
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, :password_confirmation, predence: true, 
    format: { with: /^(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}$/i }
    has_secure_password
end


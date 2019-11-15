class User < ApplicationRecord
    
    has_secure_password

    has_many :recipes

    validates :password, confirmation: true
    validates :first_name, :last_name, :email, :password, :password_confirmation, presence: true
    validates :first_name, :last_name, format: {with: /[a-zA-Z]/}
end

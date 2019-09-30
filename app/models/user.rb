class User < ApplicationRecord
    has_many :recipes
    validates :first_name, :last_name, :email, :password, presence: true
    validates :first_name, :last_name, format: {with: /[a-zA-Z]/}
    validates :password, confirmation: true
end

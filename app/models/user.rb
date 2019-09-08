class User < ApplicationRecord
    has_many :recipes
    validates :first_name, :last_name, :email, :password, presence: true
    validates :password, confirmation: true
end

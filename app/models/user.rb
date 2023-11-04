class User < ApplicationRecord
    validates :email, presence: { message: "Email can't be blank." }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i , message: "Email address is not valid..." }
    validates :username, presence: { message: "Username can't be blank." }
    validates :password, presence: { message: "Password can't be blank." }
end
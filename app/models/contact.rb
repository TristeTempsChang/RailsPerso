class Contact < ApplicationRecord
    validates :email, presence: { message: "Email can't be blank." }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i , message: "Email address is not valid..." }
    validates :nom, presence: { message: "Name can't be blank." }
    validates :message, presence: { message: "Message can't be blank." }
end
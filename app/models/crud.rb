# crud.rb
class Crud < ApplicationRecord
   belongs_to :creator, class_name: 'User', foreign_key: 'creationBy'
end  
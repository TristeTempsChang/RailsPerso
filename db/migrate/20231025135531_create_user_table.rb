class CreateUserTable < ActiveRecord::Migration[7.1]
  def change
    create_table :user do |t|
      t.string :username
      t.string :email
      t.string :password
    end
  end
end

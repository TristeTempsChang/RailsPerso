class CrudController < ApplicationController

    def index
        @user_count = User.all.length
        @product_count = Crud.count
        @contact_count = Contact.count
        if session[:user_id]
            @user = User.find_by(id: session[:user_id])
        end
    end
end     
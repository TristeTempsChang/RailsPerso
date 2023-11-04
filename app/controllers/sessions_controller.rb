class SessionsController < ApplicationController

    def new
    end

    def create 
        user = User.find_by(username: params[:username])
        pass = User.find_by(password: params[:password])
        if user.present? && pass.present?
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:alert] = "There was an error when login to the account"
            flash[:username_error] = "Username can't be blank."
            flash[:password_error] = "Password can't be blank."
            redirect_to new_session_path
        end
    end


    def logout
        session[:user_id] = nil
        redirect_to root_path
    end
end

class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash[:alert] = "There was an error creating the user. Please check the following:"
        
            flash[:email_error] = @user.errors[:email].first if @user.errors[:email].present?
            flash[:username_error] = @user.errors[:username].first if @user.errors[:username].present?
            flash[:password_error] = @user.errors[:password].first if @user.errors[:password].present?
        
            redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end
end
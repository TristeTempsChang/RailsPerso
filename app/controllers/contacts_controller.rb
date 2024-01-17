class ContactsController < ApplicationController

    def new
      if session[:user_id]
        @user = User.find_by(id: session[:user_id])
      end
      @contact = Contact.new
    end

    def create
        @contact = Contact.new(contact_params)
    
        if @contact.save
          ContactMailMailer.with(nom: @contact.nom, email: @contact.email, message: @contact.message).contact_email.deliver_now
          redirect_to root_path
        else
          flash[:alert] = "There was an error sending the message. Please check the following:"
    
          flash[:email_error] = @contact.errors[:email].first if @contact.errors[:email].present?
          flash[:name_error] = @contact.errors[:nom].first if @contact.errors[:nom].present?
          flash[:message_error] = @contact.errors[:message].first if @contact.errors[:message].present?
    
          redirect_to new_contact_path
        end
      end

    private

    def contact_params
        params.require(:contact).permit(:email, :nom, :message)
    end

end     
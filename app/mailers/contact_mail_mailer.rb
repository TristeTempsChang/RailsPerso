class ContactMailMailer < ApplicationMailer

    def contact_email

        @email = params[:email]
        @nom = params[:nom]
        @message = params[:message]

        mail(to: ENV['EMAIL_NAME'], subject: "Mail de contact depuis projet rails")
    end
end

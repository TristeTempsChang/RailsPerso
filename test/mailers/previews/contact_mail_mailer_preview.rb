# Preview all emails at http://localhost:3000/rails/mailers/contact_mail_mailer
class ContactMailMailerPreview < ActionMailer::Preview

    def contact_mail_mailer
        ContactMailMailer.contact_email
    end

end

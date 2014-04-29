class ContactMailer < ActionMailer::Base
    default from: "railscs372@gmail.com"
    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.confirmation_mailer.order_confirmation.subject
    #
    def contact_message (contact)
        @contact = contact
        mail to: "moskalem@uregina.ca", subject: "QLine Contact Message"
    end
end

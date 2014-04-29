class ConfirmationMailer < ActionMailer::Base
  default from: "railscs372@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirmation_mailer.order_confirmation.subject
  #
  def registration_confirmation (user)
      @user = user
      mail to: @user.email, subject: "QLine Registration Confirmation"
  end
end

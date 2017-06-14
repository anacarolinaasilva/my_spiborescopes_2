class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_mailer.contact_me.subject
  #
  #
  
  def contact_me(message)
    @msg  = message
    @body = message.body
    mail to: ENV['GMAIL_USERNAME'] , from: message.email
  end
end

class ContactMailer < ApplicationMailer

  def contact_email(contact)
    @contact_name = contact[:name]
    @contact_email = contact[:email]
    @message = contact[:message]
    mail(to: 'jim@jimsmithdesign.com', subject: 'You have new message from JimSmithDesign.com')
  end
end

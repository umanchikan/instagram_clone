class ContactsMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "a.cop.popo@gmail.com", subject: "お問い合わせの確認メール"
  end
end

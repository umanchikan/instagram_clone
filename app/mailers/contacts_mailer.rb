class ContactsMailer < ApplicationMailer
  def contact_mail(picture)
    @picture = picture
    mail to: "sample@gmail.com", subject: "お問い合わせの確認メール"
  end
end

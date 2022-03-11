class AnnounceMailer < ApplicationMailer
  def send_mail
    @customer=params[:customer]
    @lesson=params[:lesson]
    mail(
      from: 'washogo8@gmail.com',
      to: @customer.email,
      subject: 'お知らせ',
    )
  end
end

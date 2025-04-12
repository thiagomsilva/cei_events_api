class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end

class RegistrationMailer < ApplicationMailer
  def send_certificate
    @user = params[:user]
    @event = params[:event]
    attachments['comprovante.pdf'] = params[:pdf]
    mail(to: @user.email, subject: "Comprovante de Inscrição - #{@event.name}")
  end
end

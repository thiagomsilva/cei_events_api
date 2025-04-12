class RegistrationMailer < ApplicationMailer
  def send_certificate
    @user = params[:user]
    @event = params[:event]
    attachments['comprovante.pdf'] = params[:pdf]
    mail(to: @user.email, subject: "Comprovante de Inscrição - #{@event.name}")
  end
end
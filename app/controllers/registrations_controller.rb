class RegistrationsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    user = User.find(params[:user_id])

    # Lógica para salvar a inscrição no banco de dados
    registration = Registration.create!(event: event, user: user, status: 'confirmado')

    # Geração do comprovante
    pdf = CertificateGenerator.generate(event, user)

    # Envio do comprovante por e-mail (exemplo)
    RegistrationMailer.with(user: user, event: event, pdf: pdf).send_certificate.deliver_now

    render json: { message: 'Inscrição confirmada e comprovante enviado!' }, status: :created
  end
end
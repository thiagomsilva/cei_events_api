class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

# Serviço para geração de comprovantes de inscrição
class CertificateGenerator
  def self.generate(event, user)
    Prawn::Document.new do |pdf|
      pdf.text "Comprovante de Inscrição", size: 20, style: :bold
      pdf.move_down 20
      pdf.text "Evento: #{event.name}", size: 14
      pdf.text "Participante: #{user.name}", size: 14
      pdf.text "Número de Inscrição: #{user.id}", size: 14
      pdf.text "Data do Evento: #{event.date}", size: 14
      pdf.text "Local: #{event.location}", size: 14
      pdf.text "Valor Pago: R$ #{event.price}", size: 14
      pdf.move_down 20
      pdf.text "Data e Hora do Pagamento: #{Time.now}", size: 12
    end.render
  end
end

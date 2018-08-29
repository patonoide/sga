class UserMailer < ApplicationMailer
    default from: 'faltas@cjr.org.br'

  def welcome_email
    
    mail(to: 'gabrielporto@cjr.org.br', subject: 'Falta ou Atraso')
  end
end

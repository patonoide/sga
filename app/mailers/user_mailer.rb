class UserMailer < ApplicationMailer
    default from: 'faltas@cjr.org.br'

  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: email do diogo, subject: 'Falta ou Atraso')
  end
end

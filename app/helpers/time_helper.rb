module TimeHelper

  def traduz_data_e_hora(time)
    unless time.nil?
      "#{time.strftime("%d")} de #{traduz_mes(time.strftime("%B"))} de #{time.strftime("%Y")} às #{time.strftime("%T")}"
    else
      "Atualizar Data e Hora"
    end
  end

  def traduz_mes(mes)
    case mes
    when "January"
      "janeiro"
    when "February"
      "fevereiro"
    when "March"
      "março"
    when "April"
      "abril"
    when "May"
      "maio"
    when "June"
      "junho"
    when "July"
      "julho"
    when "August"
      "agosto"
    when "September"
      "setembro"
    when "October"
      "outubro"
    when "November"
      "novembro"
    when "December"
      "dezembro"
    end
  end

end
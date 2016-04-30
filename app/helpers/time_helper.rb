module TimeHelper

  def traduz_mes(mes)
    meses = { "January" => 'janeiro', "February" => 'fevereiro', "March" => 'março',
              "April" => 'abril', "May" => 'maio', "June" => 'junho', "July" => 'julho',
              "August" => 'agosto', "September" => 'setembro', "October" => 'outubro',
              "November" => 'novembro', "December" => 'dezembro' }
    meses[mes]
  end

  def traduz_data_e_hora(time)
    "#{time.strftime("%d")} de #{traduz_mes(time.strftime("%B"))} de #{time.strftime("%Y")} às #{time.strftime("%T")}" unless time.nil?
  end

  def traduz_para_nome_de_arquivo(time)
    "#{time.strftime("%d")}_de_#{traduz_mes(time.strftime("%B"))}_de_#{time.strftime("%Y")}" unless time.nil?
  end

end
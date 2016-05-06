module TimeHelper

  Meses = { "January"  => 'janeiro', "February"  => 'fevereiro', "March"     => 'março',
            "April"    => 'abril',   "May"       => 'maio',      "June"      => 'junho', 
            "July"     => 'julho',   "August"    => 'agosto',    "September" => 'setembro',
            "October"  => 'outubro', "November"  => 'novembro',  "December"  => 'dezembro' }

  def traduz_mes(mes)
    Meses[mes]
  end

  def traduz_data_e_hora(time)
    "#{time.strftime("%d")} de #{traduz_mes(time.strftime("%B"))} de #{time.strftime("%Y")} às #{time.strftime("%T")}" unless time.nil?
  end

  def traduz_para_nome_de_arquivo(time)
    "#{time.strftime("%d")}-#{time.strftime("%m")}" unless time.nil?
  end

end
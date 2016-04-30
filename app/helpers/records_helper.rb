module RecordsHelper

  include TimeHelper

  def download_record(ata)

    numero = ata.number
    nucleo = ata.sector.short_name
    membros = ata.users
    data = traduz_para_nome_de_arquivo(ata.date.to_time)
    
    case nucleo
      when 'NOE'
        nome = "Reunião de Organização Empresarial"
        nome_arquivo = numero.to_s + 'a_RENOE_' + data
      when 'NDP'
        nome = "Reunião de Desenvolvimento e Pesquisa"
        nome_arquivo = numero.to_s + 'a_RENDP_' + data
      when 'NAM'
        nome = "Reunião de Atendimento e Marketing"
        nome_arquivo = numero.to_s + 'a_RENAM_' + data
      when 'NUT'
        nome = "Reunião de Talentos"
        nome_arquivo = numero.to_s + 'a_RENUT_' + data
      when 'PC'
        nome = "Reunião do Pequeno Conselho"
        nome_arquivo = numero.to_s + 'a_REPC_' + data
      when 'CJR'
        nome = "Reunião Geral"
        nome_arquivo = numero.to_s + 'a_REGER_' + data
    end

    Prawn::Document.generate(Rails.root.join('tmp').to_s + "/#{nome_arquivo}.pdf") do

      repeat :all do
        move_down 50

        # header
        bounding_box [bounds.left, bounds.top], :width  => bounds.width do
          image "app/assets/images/logo.png", position: :center, scale: 0.8
        end

        # footer
        bounding_box [bounds.left, bounds.bottom], :width  => bounds.width do
          text_box "Empresa Júnior de Computação - CJR", align: :center, size: 11, at: [0, 55]
          text_box "Universidade de Brasília, Campus Darcy Ribeiro", align: :center, size: 11, at: [0, 35]
          text_box "Departamento de Ciência da Computação, Prédio CiC/EST, AT-12/11", align: :center, size: 11, at: [0, 15]
        end
      end

      move_down 50

      text "ATA DE REUNIÃO", align: :center, style: :bold, leading: 10
      text numero.to_s + "ª " + nome, align: :center, style: :bold

      move_down 50

      indent(42, 45) do
        text "Membros presentes:", leading: 10, style: :bold

        membros.each do |membro|
          text membro.name + ' - ' + membro.email, leading: 6
        end
      end

      move_down 30

      indent(42, 45) do
        text "Pautas:", leading: 10, style: :bold

        ata.discussions.each do |pauta|
          text pauta.name, leading: 6
          text pauta.content, align: :justify
          move_down 20
          if cursor < 100
            start_new_page
            move_down 100
          end
        end
      end

    end
    
    Rails.root.join('tmp').to_s + "/#{nome_arquivo}.pdf"

  end

end

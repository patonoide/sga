module RecordsHelper

  include TimeHelper

  Meetings = { "NOE" => 'Reunião de Organização Empresarial',
               "NDP" => 'Reunião de Desenvolvimento e Pesquisa',
               "NAM" => 'Reunião de Atendimento e Marketing',
               "NUT" => 'Reunião de Talentos',
               "PC"  => 'Reunião do Pequeno Conselho',
               "CJR" => 'Reunião Geral' }

  def select_meeting_name(short_name) Meetings[short_name] end

  File_short_names = { "NOE" => 'RENOE', "NDP" => 'RENDP', "NAM" => 'RENAM',
                       "NUT" => 'RENUT', "PC"  => 'REPC',  "CJR" => 'REGER' }

  def select_short_name_meeting(short_name) File_short_names[short_name] end

  def status_tag(status)
    case status
      when 'Presente'
        content_tag(:p, status, class: 'label label-success')
      when 'Falta'
        content_tag(:p, status, class: 'label label-danger')
      when 'Falta Justificada'
        content_tag(:p, status, class: 'label label-danger')
      when 'Atraso'
        content_tag(:p, status, class: 'label label-warning')
    end
  end

  def download_record(ata)

    numero = ata.number
    membros = ata.records_users
    pautas = ata.discussions
    sigla = ata.sector.short_name
    data = traduz_para_nome_de_arquivo(ata.date.to_time)
    nome = select_meeting_name(sigla)
    nome_arquivo = "[#{select_short_name_meeting(sigla)}] #{numero}ª Reunião Ata - #{data}"

    Prawn::Document.generate(Rails.root.join('tmp').to_s + "/#{nome_arquivo}.pdf") do

      bounding_box [bounds.left, bounds.top], :width  => bounds.width do
        image "app/assets/images/logo.png", position: :center, scale: 0.8
      end

      move_down 50

      text "ATA DE REUNIÃO", align: :center, style: :bold, leading: 10
      text numero.to_s + "ª " + nome, align: :center, style: :bold

      move_down 50

      indent(42, 45) do
        text "Membros:", leading: 10, style: :bold

        if membros.blank?
          text "Não há membros para esta reunião."
        else
          membros.each do |membro|
            text membro.user.name + ' - ' + membro.user.email + ' - ' + membro.status.name, leading: 6
          end
        end
      end

      move_down 30

      indent(42, 45) do
        text "Pautas:", leading: 10, style: :bold

        if pautas.blank?
          text "Não há pautas para esta reunião."
        else
          pautas.each do |pauta|
            text pauta.name, leading: 6, style: :bold
            content = Rails::Html::WhiteListSanitizer.new.sanitize(pauta.content.gsub("<br>", "\n"), tags: %w(strong em), attributes: %w(src style))
            text content, inline_format: true, align: :justify, leading: 6
            move_down 20
          end
        end
      end

    end
    
    Rails.root.join('tmp').to_s + "/#{nome_arquivo}.pdf"

  end

end

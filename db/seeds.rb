Record.destroy_all
Sector.destroy_all
User.destroy_all

nucleos = [{ name: 'Núcleo de Organização Empresarial', short_name: 'NOE' },
           { name: 'Núcleo de Desenvolvimento e Pesquisa', short_name: 'NDP' },
           { name: 'Núcleo de Atendimento e Marketing', short_name: 'NAM'},
           { name: 'Núcleo de Talentos', short_name: 'NUT'},
           { name: 'Pequeno Conselho', short_name: 'PC'},
           { name: 'Empresa Júnior de Computação', short_name: 'CJR'}]

Sector.create(nucleos)

for i in 1..10
  User.create(name: 'Membro ' + i.to_s, email: 'membro' + i.to_s + '@cjr.org.br', password: 'teste123')
end
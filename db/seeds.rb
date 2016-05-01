Sector.destroy_all
Record.destroy_all
RecordsUser.destroy_all
Discussion.destroy_all
Status.destroy_all
User.destroy_all

nucleos = [{ name: 'Núcleo de Organização Empresarial', short_name: 'NOE' },
           { name: 'Núcleo de Desenvolvimento e Pesquisa', short_name: 'NDP' },
           { name: 'Núcleo de Atendimento e Marketing', short_name: 'NAM'},
           { name: 'Núcleo de Talentos', short_name: 'NUT'},
           { name: 'Pequeno Conselho', short_name: 'PC'},
           { name: 'Empresa Júnior de Computação', short_name: 'CJR'}]
           
Sector.create(nucleos)

status = [{ name: 'Presente' }, { name: 'Falta' }, { name: 'Falta Justificada' } ]

Status.create(status)

for i in 1..10
  User.create(name: 'Membro ' + i.to_s, email: 'membro' + i.to_s + '@cjr.org.br', password: 'teste123')
end

User.create(name: 'Administrador', email: 'admin@cjr.org.br', password: 'admincjr')
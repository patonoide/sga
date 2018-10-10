Sector.destroy_all
RecordsUser.destroy_all
Record.destroy_all
Discussion.destroy_all
Status.destroy_all
User.destroy_all
Role.destroy_all

nucleos = [{ name: 'Núcleo de Organização Empresarial', short_name: 'NOE' },
           { name: 'Núcleo de Desenvolvimento e Pesquisa', short_name: 'NDP' },
           { name: 'Núcleo de Atendimento e Marketing', short_name: 'NAM'},
           { name: 'Núcleo de Talentos', short_name: 'NUT'},
           { name: 'Pequeno Conselho', short_name: 'PC'},
           { name: 'Empresa Júnior de Computação', short_name: 'CJR'}]

Sector.create(nucleos)

status = [{ name: 'Presente' }, { name: 'Falta' }, { name: 'Falta Justificada' }, { name: 'Atraso' } ]

Status.create(status)

admin = Role.create(name: 'Administrador')
usuario_comum = Role.create(name: 'Usuário Comum')

User.create(name: 'Administrador', email: 'admincjr@cjr.org.br', password: 'admincjr', role_id: admin.id)
User.create(name: 'Usuário Comum', email: 'comum@comum.com',password:'teste123',role_id: usuario_comum.id)

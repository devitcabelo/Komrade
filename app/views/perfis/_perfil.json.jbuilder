json.extract! perfil, :id, :usuario_id, :nome, :sobrenome, :cpf, :celular, :data_nascimento, :tipo, :created_at, :updated_at
json.url perfil_url(perfil, format: :json)

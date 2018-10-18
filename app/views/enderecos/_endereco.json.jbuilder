json.extract! endereco, :id, :cep, :estado, :cidade, :bairro, :logradouro, :complemento, :numero, :responsavel, :perfil_id, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)

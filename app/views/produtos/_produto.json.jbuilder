json.extract! produto, :id, :nome, :descricao, :valor_locacao, :nota, :plataforma, :genero, :estudio, :idade_recomendada, :data_lancamento, :resolucao_maxima, :tipo, :created_at, :updated_at
json.url produto_url(produto, format: :json)

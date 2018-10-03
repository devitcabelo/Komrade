json.extract! carrinho, :id, :itens_id, :total, :created_at, :updated_at
json.url carrinho_url(carrinho, format: :json)

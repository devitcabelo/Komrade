class Perfil < ApplicationRecord
  belongs_to :usuario
  has_many :enderecos
  has_many :pedidos
  has_many :favoritos
  has_many :lista_desejos

  validates_presence_of :nome, :sobrenome, :cpf, :celular, :data_nascimento, :usuario, :tipo

  def to_s
    [nome, sobrenome].join(' ')
  end

  def favoritar_ou_desfavoritar produto
    unless self.favoritos.pluck(:produto_id).include?(produto.id)
      Favorito.create(produto: produto, perfil: self)
    else
      self.favoritos.find_by(produto_id: produto.id).destroy
    end
  end

  def adicionar_ou_remover_a_lista_desejos produto
    unless self.lista_desejos.pluck(:produto_id).include?(produto.id)
      ListaDesejo.create(produto: produto, perfil: self)
    else
      self.lista_desejos.find_by(produto_id: produto.id).destroy
    end
  end
end

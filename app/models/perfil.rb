class Perfil < ApplicationRecord
  belongs_to :usuario
  has_many :enderecos
  has_many :pedidos
  has_many :favoritos
  has_many :produtos_favoritos, through: :favoritos, source: :produto
  has_many :lista_desejos
  has_many :produtos_lista_desejos, through: :lista_desejos, source: :produto
  has_one :recomendacao
  
  validates_presence_of :nome, :sobrenome, :cpf, :celular, :data_nascimento, :usuario, :tipo

  after_create :cria_recomendacao

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

  def cria_recomendacao
    Recomendacao.create(perfil_id: self.id)
  end

  def calcula_recomendacoes
    genero_total_f = self.produtos_favoritos.group(:genero).count
    genero_total_f.each { |k, v| genero_total_f[k] = v * 2 } #Um favorito soma 2 pontos

    genero_total_ld = self.produtos_lista_desejos.group(:genero).count
    
    genero_total = genero_total_f.merge(genero_total_ld){|k, a_value, b_value| a_value + b_value}
    
    Recomendacao.find_by(perfil_id: self.id).update_attributes(recomendacoes: genero_total)
  end
end

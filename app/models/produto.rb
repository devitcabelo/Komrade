class Produto < ApplicationRecord
  # EXTENDS
  extend Enumerize

  monetize :valor_locacao_cents

  # ENUMERIZE
  enumerize :plataforma, in: ["Playstation 4", "Xbox One", "Nintendo Switch"], predicates: false
  enumerize :genero, in: ["Ação", "Aventura", "Luta", "Plataforma", "Puzzle", "Corrida", "RPG", "FPS", "Simulador", "Esportes", "Estratégia", "Terror", "Misc"], predicates: true
  enumerize :tipo, in: ["Acessório", "Jogo", "Console"], predicates: true
  enumerize :resolucao_maxima, in: ["480i", "480p", "720p", "1080p", "4k"], predicates: false

  #MAP
  has_many :itens
  
  def data_lancamento_formatada
    I18n.l self.data_lancamento
  end

  def itens_disponiveis quantidade
    self.itens.nao_alugados.limit(quantidade)
  end

  def to_s
    self.nome
  end

  def favorito_do perfil
    perfil.favoritos.map(&:produto_id).include?(self.id)
  end

  def na_lista_de_desejos_do perfil
    perfil.lista_desejos.map(&:produto_id).include?(self.id)
  end

  def ordem_na_recomendacao perfil
    if self.genero.present?
      return (perfil.recomendacao.recomendacoes[self.genero] || 0 ) * -1
    end
    return 0
  end

  def self.ordem_recomendacoes perfil, produtos
    produtos.sort_by{|p| p.ordem_na_recomendacao(perfil)}
  end

end

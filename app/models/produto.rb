class Produto < ApplicationRecord
  # EXTENDS
  extend Enumerize

  monetize :valor_locacao_cents

  # ENUMERIZE
  enumerize :plataforma, in: ["Playstation 4", "Xbox One", "Nintendo Switch"], predicates: false
  enumerize :genero, in: ["Ação", "Aventura", "Luta", "Plataforma", "Puzzle", "Corrida", "RPG", "FPS", "Simulador", "Esportes", "Estratégia", "Terror", "Misc"], predicates: true
  enumerize :tipo, in: ["Acessório", "Jogo", "Console"], predicates: true
  enumerize :resolucao_maxima, in: ["480i", "480p", "720p", "1080p", "4k"], predicates: false
  
  def data_lancamento_formatada
    I18n.l self.data_lancamento
  end

end

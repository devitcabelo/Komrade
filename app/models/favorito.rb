class Favorito < ApplicationRecord
  belongs_to :perfil
  belongs_to :produto

  after_save :calcula_recomendacoes
  after_destroy :calcula_recomendacoes

  def calcula_recomendacoes
    self.perfil.calcula_recomendacoes
  end
end

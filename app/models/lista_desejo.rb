class ListaDesejo < ApplicationRecord
  belongs_to :produto
  belongs_to :perfil

  after_save :calcula_recomendacoes
  after_destroy :calcula_recomendacoes

  def calcula_recomendacoes
    self.perfil.calcula_recomendacoes
  end
end

class Recomendacao < ApplicationRecord
  belongs_to :perfil

  serialize :recomendacoes
end

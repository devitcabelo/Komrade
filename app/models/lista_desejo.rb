class ListaDesejo < ApplicationRecord
  belongs_to :produto
  belongs_to :perfil
end

class Favorito < ApplicationRecord
  belongs_to :perfil
  belongs_to :produto
end

class Perfil < ApplicationRecord
  belongs_to :usuario

  validates_presence_of :nome, :sobrenome, :cpf, :celular, :data_nascimento, :usuario, :tipo
end

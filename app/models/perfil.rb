class Perfil < ApplicationRecord
  belongs_to :usuario
  has_many :enderecos
  
  validates_presence_of :nome, :sobrenome, :cpf, :celular, :data_nascimento, :usuario, :tipo
end

class Endereco < ApplicationRecord
  belongs_to :perfil

  validates_presence_of :cep, :estado, :cidade, :bairro, :logradouro,
    :numero, :responsavel
    
  def to_s
    [estado, cidade, bairro, numero, complemento, responsavel].reject(&:blank?).compact.join(', ') 
  end
end

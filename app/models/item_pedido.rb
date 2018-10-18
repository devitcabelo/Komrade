class ItemPedido < ApplicationRecord
  belongs_to :pedido
  belongs_to :item

  def data_inicio_e_fim_form
    if self.data_inicio && self.data_fim
      return (self.data_inicio.strftime('%d/%m/%Y') + " - " + self.data_fim.strftime('%d/%m/%Y'))
    else
      return nil
    end
  end
end
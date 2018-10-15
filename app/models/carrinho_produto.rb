class CarrinhoProduto < ApplicationRecord
  belongs_to :carrinho
  belongs_to :produto

  def data_inicio_e_fim_form
    if self.data_inicio && self.data_fim
      return (self.data_inicio.strftime('%d/%m/%Y') + " - " + self.data_fim.strftime('%d/%m/%Y'))
    else
      return nil
    end
  end

  def self.split_begin_end date
    date = date.split(' - ')
    { begin: date[0], end:date[1] }
  end
end

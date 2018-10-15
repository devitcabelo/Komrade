class DataAluguelProduto < ApplicationRecord
  
  def self.split_begin_end date
    date = date.split(' - ')
    { begin: date[0], end:date[1] }
  end
end
class Item < ApplicationRecord
  #MAP
  belongs_to :produto

  #VALIDATIONS
  validates :codigo, uniqueness: true
  validates :codigo, :produto, presence: true

  #DELEGATES
  delegate :nome, to: :produto, prefix: true

  def codigo=(value)
    value = produto_nome.split.map(&:first).join + "#" + value if value.present?
    super(value)
  end
end

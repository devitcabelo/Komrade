class Item < ApplicationRecord
  #MAP
  belongs_to :produto

  has_many :item_pedidos
  has_many :pedidos, through: :item_pedidos

  #VALIDATIONS
  validates :codigo, uniqueness: true
  validates :codigo, :produto, presence: true

  #SCOPES
  scope :nao_alugados, -> { where(alugado: false) }

  #DELEGATES
  delegate :nome, to: :produto, prefix: true

  def codigo=(value)
    value = produto_nome.split.map(&:first).join + "#" + value if value.present?
    super(value)
  end
end

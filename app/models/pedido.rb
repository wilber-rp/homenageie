class Pedido < ApplicationRecord
  belongs_to :coroa
  belongs_to :velorio
  belongs_to :pagamento
  belongs_to :entrega
  belongs_to :user
end

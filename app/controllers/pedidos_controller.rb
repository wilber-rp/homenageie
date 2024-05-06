class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all
  end

  def new
    @pedido = Pedido.new
    @velorios = Velorio.all
    @pagamentos = Pagamento.all
    @coroa = Coroa.find(params[:format])
  end

  def create
    @pedido = Pedido.new(pedido_params)
    @velorios = Velorio.all
    @coroa = Coroa.find(params[:pedido][:coroa_id])

    @pedido.user = current_user
    @pedido.coroa_id = params[:pedido][:coroa_id]
    @pedido.entrega_id = 1
    @pedido.pagamento_id = 1
    if @pedido.save
      redirect_to pedido_path(@pedido), notice: 'pedido inserido com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pedido_params
    params.require(:pedido).permit(:nome_falecido, :data_velorio, :velorio_id, :faixa, :coroa_id)
  end
end

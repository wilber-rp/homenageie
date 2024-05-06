class PedidosController < ApplicationController

  def new
    @pedido = Pedido.new
    @velorios = Velorio.all
    @pagamentos = Pagamento.all
  end

  def create
    @pedido = Pedido.new

    @pedido = current_user.build_pedido(pedido_params)

    if @pedido.save
      redirect_to pedido_path(@pedido), notice: 'pedido inserida com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pedido_params
    params.require(:pedido).permit(:nome_falecido, :data_velório, :hora_velorio, :faixa)
  end
end

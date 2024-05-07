class PedidosController < ApplicationController
  def index
    @pedidos = Pedido.all
  end

  def new
    @pedido = Pedido.new
    @velorios = Velorio.all
    @pagamentos = Pagamento.all
    @coroa = Coroa.find(params[:coroa_id])
  end

  def create
    @pedido = Pedido.new(pedido_params)
    @velorios = Velorio.all
    @coroa = Coroa.find(params[:pedido][:coroa_id])

    @pedido.user = current_user
    @pedido.coroa_id = params[:pedido][:coroa_id]
    @entrega = Entrega.new(status: "Aguardando Pagamento")
    @pagamento = Pagamento.new(status: "Aguardando Pagamento")

    @pedido.pagamento = @pagamento
    @pedido.entrega = @entrega

    if @pedido.save
      @pagamento.save
      @entrega.save
      redirect_to edit_pedido_pagamento_path(@pedido, @pagamento), notice: 'pedido inserido com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pedido_params
    params.require(:pedido).permit(:nome_falecido, :data_velorio, :velorio_id, :faixa, :coroa_id)
  end
end

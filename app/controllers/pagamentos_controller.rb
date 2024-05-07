class PagamentosController < ApplicationController

  def edit
    @pagamento = Pagamento.find(params[:id])
  end

  def update
    @pagamento = Pagamento.find(params[:id])
    @pagamento.status = "Processando pagamento"

    if @pagamento.update(pagamento_params)
      redirect_to pedidos_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def pagamento_params
    params.require(:pagamento).permit(:tipo, :parcelas, :identificador, :card_token)
  end
end

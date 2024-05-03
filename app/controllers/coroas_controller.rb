class CoroasController < ApplicationController
  def create
    @coroa = current_user.build_coroa(coroa_params)

    if @coroa.save
      redirect_to coroa_path(@coroa), notice: 'coroa inserida com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def coroa_params
    params.require(:coroa).permit(:codigo, :descricao, :preco_em_centavos)
  end
end

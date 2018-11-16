class FavoritosController < ApplicationController
  before_action :set_favorito, only: [:destroy]

  # GET /favoritos
  # GET /favoritos.json
  def index
    @favoritos = perfil.favoritos
  end

  # POST /favoritos
  # POST /favoritos.json
  def create
    @favorito = Favorito.new(favorito_params)

    respond_to do |format|
      if @favorito.save
        format.html { redirect_to back_uri, warning: 'Favorito adicionado com sucesso.' }
        format.json { render :show, status: :created, location: @favorito }
      else
        format.html { render :new }
        format.json { render json: @favorito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favoritos/1
  # DELETE /favoritos/1.json
  def destroy
    @favorito.destroy
    respond_to do |format|
      format.html { redirect_to back_uri, warning: 'Favorito removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorito
      @favorito = Favorito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorito_params
      params.require(:favoritos).permit(:produto_id, :perfil_id)
    end
end

class ListaDesejosController < ApplicationController
  def index
    @lista_desejos = self.perfil.lista_desejos
  end

  # POST /lista_desejos
  # POST /lista_desejos.json
  def create
    @lista_desejo = ListaDesejo.new(lista_desejo_params)

    respond_to do |format|
      if @lista_desejo.save
        format.html { redirect_to back_uri, notice: 'Adicionado a lista de desejos.' }
        format.json { render :show, status: :created, location: @lista_desejo }
      else
        format.html { render :new }
        format.json { render json: @lista_desejo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lista_desejos/1
  # DELETE /lista_desejos/1.json
  def destroy
    @lista_desejo.destroy
    respond_to do |format|
      format.html { redirect_to back_uri, notice: 'Removido da lista de desejos.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_lista_desejo
    @lista_desejo = ListaDesejo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lista_desejo_params
    params.require(:lista_desejo).permit(:produto_id, :perfil_id)
  end
end

class ListaDesejosController < ApplicationController
  def index
    @lista_desejos = self.perfil.lista_desejos
  end
end

class HomeController < ApplicationController
  before_action :authenticate_usuario!
  def index
    redirect_to produtos_path
  end
end
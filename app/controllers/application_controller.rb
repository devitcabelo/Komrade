class ApplicationController < ActionController::Base
  #before_action :authenticate_usuario!
  protect_from_forgery with: :exception
  helper_method :current_cart, :can_control, :perfil, :esvaziar_carrinho, :back_uri
  before_action :logado_sem_cadastro, unless: :devise_controller?

  add_flash_types :danger, :info, :warning, :success

  def can_control
    current_usuario.admin?
  end

  def perfil
    current_usuario.perfil
  end

  def esvaziar_carrinho
    session[:carrinho_id] = nil
  end

  def current_cart
    if session[:carrinho_id].present?
      Carrinho.find(session[:carrinho_id])
    else
      carrinho = Carrinho.create
      session[:carrinho_id] = carrinho.id
      carrinho
    end
  end

  def back_uri
    request.env['HTTP_REFERER']
  end
   
  protected

  def logado_sem_cadastro
    if current_usuario.present? && current_usuario.perfil.nil?
      flash[:warning] = "Você precisa finalizar seu cadastro para continuar a navegar." 
      redirect_to new_usuario_session_url 
    end
  end

  def after_sign_in_path_for(resource)

    sign_in_url = new_usuario_session_url

    if resource.perfil.nil?
      new_perfil_path
    elsif request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

end

class SessionsController < Devise::SessionsController
  skip_before_filter :logado_sem_cadastro
end
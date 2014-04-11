MagicHangman::Application.routes.draw do
  resources :games, only: [:new, :create, :show]
end

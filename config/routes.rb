MagicHangman::Application.routes.draw do
  resources :games, only: [:new, :create, :show] do
    resources :guesses, only: [:create]
  end
end

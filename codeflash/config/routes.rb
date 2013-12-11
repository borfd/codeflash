Codeflash::Application.routes.draw do
  root 'home#index'
  resources :flashcards
  resources :answers do
  	get 'verify'
  end

  require 'sidekiq/web'
# ...
	mount Sidekiq::Web, at: '/sidekiq'
end

Codeflash::Application.routes.draw do
  root 'home#index'
  resources :flashcards
  resources :answers
end

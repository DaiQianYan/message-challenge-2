Rails.application.routes.draw do

  root to: 'static_pages#home'

  get "/chat", to: "chat#index"
  
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resource :chat

  resource :chats, param: :slug

  resource :messages
  
  resources :users

  mount ActionCable.server => '/cable'

end

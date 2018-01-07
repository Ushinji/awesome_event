Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :events
  
  get '/users/:id', to: 'users#show'

  post '/events/:id/join/', to: 'participations#create'
  delete '/events/:id/cancel/', to: 'participations#destroy'
end

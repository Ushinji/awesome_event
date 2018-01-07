Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/events/new', to: 'events#new'
  get '/events', to: 'events#index'
  get '/events/:id', to: 'events#show'
  post '/events', to: 'events#create'
end

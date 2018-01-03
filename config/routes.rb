Rails.application.routes.draw do
  #resources :events
  root to: 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/events', to: 'events#create'
end

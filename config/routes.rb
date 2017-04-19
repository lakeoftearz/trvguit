Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
    get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/fcomps', to: 'fcomps#index'
  get '/newfc', to: 'fcomps#new'
  post '/newfc',  to: 'fcomps#create'
  get '/newreview', to: 'fcomps#newreview'
  post '/newreview',  to: 'fcomps#createreview'  
  resources :users
  resources :fcomps
  resources :reviews
 # get 'fcomps/:id/edit', to: 'fcomps#edit'
 # put 'fcomps/:id', to: 'fcomps#update'

  
end

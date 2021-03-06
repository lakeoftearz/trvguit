Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  post '/rate' => 'rater#create', :as => 'rate'
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
  get '/newreview', to: 'reviews#new'
  post '/newreview',  to: 'reviews#create'    
  resources :users
  resources :fcomps do
  resources :reviews, only: [ :new, :create, :show, :edit, :update]
   member do
       get :publishreview
       put :publishreview
       get :unpublishreview
       put :unpublishreview
    end
  end
  resources :reviews, only: [ :index, :destroy]
 # get 'fcomps/:id/edit', to: 'fcomps#edit'
 # put 'fcomps/:id', to: 'fcomps#update'

  
end

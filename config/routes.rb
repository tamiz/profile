Rails.application.routes.draw do
  get '/home',   to: 'staticpages#home'
  get '/help',   to: 'staticpages#help'
  get '/contact',to: 'staticpages#contact'
  get '/about',  to: 'staticpages#about'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
  root 'staticpages#home'
  resources :users
  resources :microposts

end

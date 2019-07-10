Rails.application.routes.draw do
  get '/home',   to: 'staticpages#home'
  get '/help',   to: 'staticpages#help'
  get '/contact',to: 'staticpages#contact'
  get '/about',  to: 'staticpages#about'
  root 'staticpages#home'
  resources :users
end

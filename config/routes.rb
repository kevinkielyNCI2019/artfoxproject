Rails.application.routes.draw do
  
  resources :artworks
  devise_for :artists
  devise_for :customers
  root 'static_pages#home'
  
  get '/aboutus' => 'static_pages#aboutus'
  
  get '/faq' => 'static_pages#faq'
  
 # root :to => 'site#home'
 
   get '/artist-account' => 'static_pages#artist-account'
   get '/customer-account' => 'static_pages#customer-account'
  
  #  get 'static_pages/home'
 # get 'static_pages/aboutus'
  #get 'static_pages/faq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

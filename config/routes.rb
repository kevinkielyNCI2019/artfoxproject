Rails.application.routes.draw do
  
  get 'artwork_favorites/update'
  get 'orderartworks/index'
  get 'orderartworks/show'
  get 'orderartworks/new'
  get 'orderartworks/edit'
  
  resources :orders do 
    resources:orderitems
  end
  
  
  get 'cart/index'
  resources :artworks
  devise_for :artists
  
  devise_for :customers do
      resources:orders
      
    end
    
get '/checkout' => 'cart#createOrder'
    
    
  root 'static_pages#home'
  
  get '/aboutus' => 'static_pages#aboutus'
  
  get '/faq' => 'static_pages#faq'
  
  
 #root :to => 'site#home'
 
   get '/artist-account' => 'static_pages#artist-account'
   get '/customer-account' => 'static_pages#customer-account'
  
  
  #CART ROUTES
  get '/cart/clear', to: 'cart#clearCart'
  get '/cart' =>'cart#index'
  get '/cart/:id', to: 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  
  
  get '/paid/:id' => 'static_pages#paid'
  
  #  get 'static_pages/home'
 # get 'static_pages/aboutus'
  #get 'static_pages/faq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

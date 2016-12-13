Rails.application.routes.draw do
  
  #match 'home/index', via: :get, :as => 'index'
  #match 'home/static', via: :get, :as => 'home'

  root 'home#static'
  get '/:controller(/:action)'
  get '/auth/twitter/callback', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

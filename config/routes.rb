Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#welcome'

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'



  get '/login' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#logout'

  get '/home' => 'application#home', :as => "home"
end

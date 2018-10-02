Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :contacts
get '/' => 'users#index'
post '/sessions' => 'sessions#create'
post '/users' => 'users#create'
get '/contact' => 'contacts#index'
delete '/sessions.current' => 'sessions#destroy'

resources :messages, only: [:create, :new, :index]

end

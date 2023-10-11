Rails.application.routes.draw do
  # link_to 'logout', destroy_user_session_path, :method => :delete

  get '/current_user',to: 'curent_user#index'
  devise_for :users,path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :device_infos
  resources :users
  resources :posts 
  get "/weather_api", to: "weathers#index"
  get "/get_first_api", to: "users#get_first_api"
  post "/post_first_api", to: "posts#post_first_api"
end

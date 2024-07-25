Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "about#index"
    get "/about", to: "about#index"

  resources :notes

  resources :candles

  devise_scope :user do      
       get '/users/sign_out' => 'devise/sessions#destroy'  
       post '/users/sign_out' => 'devise/sessions#destroy'   
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end

Rails.application.routes.draw do
  root "welcome#index"
  get "auth/:provider/callback", to: "sessions#create" #, as: :auth_callback
  delete "logout", to: "sessions#destroy"
  resources :events

  # :providerは認証プロバイダーの名前（例: github）を示します
  # asはルーティングヘルパーの名前を指定します
  
  # get "auth/failure", to: "sessions#failure", as: :auth_failure
  # OmniAuthの認証失敗時のルーティングを設定します
  # get "signout", to: "sessions#destroy", as: :signout
  # サインアウトのルーティングを設定します  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

Rails.application.routes.draw do
  root 'invoices#index'

  resources :entities, only: [:index, :create]

  resources :deals, only: [:index, :create]

  get '/invoices', to: 'invoices#index'

  get '/invoices/:id', to: 'invoices#show'

  get '/invoices/:id/registers',to: 'invoice_registers#show'

  get '/entities', to: 'entities#index'

  get '/deals', to: 'deals#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

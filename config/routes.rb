Rails.application.routes.draw do
  root 'invoices#index'

  resources :entities, only: [:index, :create]

  resources :deals, only: [:index, :create]

  resources :products, only: [:index, :create_instance, :create_master]

  resources :invoices, only: [:index, :show, :create]

  get '/invoices', to: 'invoices#index'

  get '/invoices/:id', to: 'invoices#show'

  get '/invoices/:id/registers',to: 'invoice_registers#show' # Capaz sacar este Controller y meterlo de una en InvoiceController

  get '/entities', to: 'entities#index'

  get '/deals', to: 'deals#index'

  get '/products', to: 'products#index'

  post '/products/create_instance', to: 'products#create_instance'

  post '/products/create_master', to: 'products#create_master'

  post '/invoices/create', to: 'invoices#create'

  get '/deals_controller/update_database', to: 'deals#update_database'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

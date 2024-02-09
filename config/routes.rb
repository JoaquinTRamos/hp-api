Rails.application.routes.draw do
  root 'invoices#index'

  resources :entities, only: [:index, :create]

  resources :deals, only: [:index, :create]

  resources :products, only: [:index, :create_instance, :create_master]

  resources :invoices, only: [:index, :show, :create]

  post '/transaction_token', to: 'impacts#generate_transaction_token'

  get '/invoices', to: 'invoices#index'

  get '/invoices/:id', to: 'invoices#show'

  get '/invoices/:id/registers', to: 'invoice_registers#show' # Capaz sacar este Controller y meterlo de una en InvoiceController

  get '/invoices/register/:serial_id', to: 'invoice_registers#find_register_by_product_serial_id'

  get '/entities', to: 'entities#index'

  get '/entities/:id', to: 'entities#show'

  get '/deals', to: 'deals#index'

  get '/deals/register/:id', to: 'deals#show_register'

  get '/deals/:sku/:date', to: 'deals#find_deal_by_sku_and_date'

  get '/products', to: 'products#index'

  get '/products/:id', to: 'products#find_by_id'

  get '/products/serial/:id', to: 'products#find_by_serial_id'

  get '/products/:serial/exists', to: 'products#serial_id_exists'

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

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get '/admin', to: 'admin#dashboard', as: 'admin_dashboard'
  get 'merchants/:id/dashboard', to: 'merchants#dashboard', as: 'merchant_dashboard'
  # post 'admin/merchants/new', to: 'admin/merchants#create', as: 'create_admin_merchant'

  namespace :admin do
    resources :merchants, only: [:index, :edit, :create, :show, :update, :new]
    resources :invoices, only: [:index, :show, :update]
  end

  resources :merchants, only: [:create, :new] do
    resources :items, except: [:destroy], controller: 'merchants/items'
    resources :invoices, only: [:index, :show, :update], controller: 'merchants/invoices'
  end

  resources :invoice_items, only: [:update], controller: 'merchants/invoice_items'
end

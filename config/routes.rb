Rails.application.routes.draw do

  get 'test_order/create'
  get 'test_order/index'
  get 'users/show'
  get 'cards/new'
  

  devise_for :companies, :controllers => {
    :confirmations => 'companies/confirmations',
    :registrations => 'companies/registrations',
    :sessions => 'companies/sessions',
    :passwords => 'companies/passwords'
   }

  
  devise_for :users, :controllers => {
    :confirmations => 'users/confirmations',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
   }

  #resources :testers


  resources :products do
    collection do
    get :scan
    end
    member do
      get :product_page
    end
  end

  resources :testers do
    member do
    get :tester_page
    end
  end


  resources :cards, only: [:new, :create]
  resources :users, only: [:show, :index]
  resources :companies, only: [:index, :show]

  #resources :products, only: :index do
  resources :orders, only: [:create, :show]
  #patch 'shipping/:id' ,:controller =>'orders',:action=>'shipping'
  #end
  resources :orders do
    member do
      get :company_index
      patch :shipping
    end
  end
  
  resources :test_orders do
    member do
      get :company_index
      patch :shipping
    end
  end

  devise_scope :user do
    get 'mypage', to: 'devise/registrations#show', as: :mypage
  end


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

    root 'orders#index'

  
    get '*path', controller: 'application', action: 'render_404'

end

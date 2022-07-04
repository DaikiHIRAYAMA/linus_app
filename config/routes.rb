Rails.application.routes.draw do
  get 'users/show'
  get 'cards/new'
  devise_for :companies
  devise_for :users
  resources :products
  resources :cards, only: [:new, :create]
  resources :users, only: [:show, :index]
  resources :companies, only: [:index, :show]

  #resources :products, only: :index do
  resources :orders, only: [:create, :show]
  #end
  resources :orders do
    member do
      get :company_index
    end
  end

  resources :products do
     get :scan 
  end


  resources :orders, only: [:index, :show]

  devise_scope :user do
    get 'mypage', to: 'devise/registrations#show', as: :mypage
  end


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'orders#index'

end

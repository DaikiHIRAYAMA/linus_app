Rails.application.routes.draw do
  devise_for :companies
  devise_for :users
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
#  devise_for :companies, controllers: {
#    sessions:      'companies/sessions',
#    passwords:     'companies/passwords',
#    registrations: 'companies/registrations'
#  }
#  devise_for :users, controllers: {
#    sessions:      'users/sessions',
#    passwords:     'users/passwords',
#    registrations: 'users/registrations'
#  }


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'products#index'

end

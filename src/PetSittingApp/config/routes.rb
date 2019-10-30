Rails.application.routes.draw do
  resources :bookings
  devise_for :sitter_users, :controllers => {:registrations => "sitter_users/registrations"}
  devise_for :owner_users, :controllers => {:registrations => "owner_users/registrations"}
  get 'owners/sitters', to: 'sitters#all_sitters'
  resources :owners
  resources :sitters


  root to: "pages#home"
  get 'sign_up', to: 'pages#sign_up'
  get 'sign_in', to: 'pages#sign_in'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

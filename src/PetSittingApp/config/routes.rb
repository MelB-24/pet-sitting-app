Rails.application.routes.draw do
  resources :dogs
  resources :bookings
  devise_for :sitter_users, :controllers => {:registrations => "sitter_users/registrations"}
  devise_for :owner_users, :controllers => {:registrations => "owner_users/registrations"}
  get 'owners/sitters', to: 'sitters#all_sitters'
  post 'owners/sitter/:sitter_id', to: 'sitters#approve_sitter', as: 'approved'
  get 'owners/my_sitters', to: 'owners#my_sitters'
  delete "owners/sitter/:approved_sitter_id", to: "owners#destroy_approved_sitter", as: "test"
  # post 'owners/sitter/:sitter_id', to: 'sitters#approve_sitter', as: 'test'
  resources :owners
  resources :sitters


  root to: "pages#home"
  get 'sign_up', to: 'pages#sign_up'
  get 'sign_in', to: 'pages#sign_in'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

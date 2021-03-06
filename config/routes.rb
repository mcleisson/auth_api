Rails.application.routes.draw do
  #mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :users
    end
  end
end

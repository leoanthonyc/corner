Rails.application.routes.draw do
  devise_for :users

  resources :links do
    resources :clicks, only: :create
  end

  root "links#index"
end

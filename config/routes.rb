require 'sidekiq/web'

Rails.application.routes.draw do
  # authenticate :user, lambda { |u| u.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  mount Sidekiq::Web => '/sidekiq'

  resources :projects do
    resources :comments, module: :projects #make projects/comments#index
  end

  devise_for :users
  root to: 'projects#index'
  
end

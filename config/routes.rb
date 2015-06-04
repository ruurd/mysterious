Rails.application.routes.draw do

  # Use devise for authentication
  devise_for :user

  # Keepalive monitoring
  get 'keepalive', to: 'keepalive#keepalive'

  # Changing locale
  get 'change_locale', to: 'application#change_locale'

  scope '(:locale)' do
    get 'about', to: 'about#index'
    get 'sysinfo', to: 'sysinfo#index'

    resources :users
    resources :questions do
      resources :answers
      member do
        get 'google_it'
        get 'come_back_later'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'sessions', to: 'sessions#create'
        delete 'sessions', to: 'sessions#destroy'
      end

      resources :questions, only: [:index, :show, :create, :update, :destroy] do
        resources :answers, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end

  root 'welcome#index'

  authenticated :user, -> user { user.admin? } do
    mount Delayed::Web::Engine, at: '/jobs'
  end

end

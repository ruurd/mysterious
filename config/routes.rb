Rails.application.routes.draw do
  devise_for :users

  # Keepalive monitoring
  get 'keepalive', to: 'monitor#keepalive'

  # Changing locale
  get 'change_locale', to: 'application#change_locale'

  scope '(:locale)' do
    get 'about', to: 'about#index'
    get 'sysinfo', to: 'sysinfo#index'

    resources :users
    resources :questions
  end

  root 'welcome#index'

end

Rails.application.routes.draw do
  devise_for :users

  # Keepalive monitoring
  get 'keepalive', to: 'monitor#keepalive'

  # Changing locale
  get 'change_locale', to: 'application#change_locale'

  scope '(:locale)' do
    get 'mysteries', to:'mysteries#index'
    get 'about', to: 'about#index'
    get 'sysinfo', to: 'sysinfo#index'
  end

  root 'welcome#index'

end

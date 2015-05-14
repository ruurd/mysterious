Rails.application.routes.draw do
  # Keepalive monitoring
  get 'keepalive', to: 'monitor#keepalive'

  # Changing locale
  get 'change_locale', to: 'application#change_locale'

  scope '(:locale)' do
    get 'mysterious', to:'mysterious#index'
    get 'about', to: 'about#index'
    get 'sysinfo', to: 'sysinfo#index'
  end

  root 'welcome#index'

end

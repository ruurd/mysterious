class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Change locale
  def change_locale
    if Settings.translations.application.include?(params[:new_locale])
      I18n.locale = params[:new_locale]
      if request.referrer
        uri = request.referer.dup
        route = Rails.application.routes.recognize_path(uri)
        route[:locale] = params[:new_locale]
        redirect_to(url_for(route))
      else
        redirect_to(root_path)
      end
    end
  end

  # Set locale
  def set_locale
    I18n.locale = params[:locale] || session[:locale] || locale_from_tld || I18n.default_locale
    session[:locale] = I18n.locale
  end

end

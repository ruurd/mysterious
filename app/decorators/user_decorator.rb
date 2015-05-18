class UserDecorator < Draper::Decorator
  delegate_all

  def admin
    object.admin? ? 'administrator' : 'user'
  end

end

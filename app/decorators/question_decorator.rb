class QuestionDecorator < Draper::Decorator
  delegate_all

  def user
    object.user.email
  end
end

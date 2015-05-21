class QuestionDecorator < Draper::Decorator
  delegate_all

  def user
    object.user.email
  end

  def answer_count
    object.answers.count
  end

  def googled_at
    object.googled_at.strftime('%Y%m%dT%H%M%S') unless object.googled_at.nil?
  end

  def created_at
    object.created_at.strftime('%Y%m%dT%H%M%S')
  end

  def updated_at
    object.updated_at.strftime('%Y%m%dT%H%M%S')
  end

end

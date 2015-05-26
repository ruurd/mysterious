#============================================================================
# Answer decorator. Decorators are a solution to helpers that tend to
# pollute the namespace.
#
class AnswerDecorator < Draper::Decorator
  delegate_all

  def googled
    'googled' if object.googled?
  end

  def created_at
    object.created_at.strftime('%Y%m%dT%H%M%S')
  end

  def updated_at
    object.updated_at.strftime('%Y%m%dT%H%M%S')
  end
end

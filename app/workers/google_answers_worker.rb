class GoogleAnswersWorker
  def google_answers(question)

    # Drop the old googled answers
    question.answers.each do |answer|
      answer.delete if answer.googled?
    end

    # Google and fill answers
    Google::Search::Web.new do |search|
      search.query = question.query
      search.size = :small
    end.each do |item|
      answer = Answer.new
      answer.question = question
      answer.googled = true
      answer.title = item.title
      answer.content = item.content
      answer.link = item.uri
      question.answers << answer
    end
    question.googled_at = Time.now
    question.save!
  end

  handle_asynchronously :google_answers
end
#============================================================================
# Answers controller. Checks if passed parameters are valid before continuing
#
class Api::V1::AnswersController < Api::V1::ApiController

  # Don't do CSRF checks on this
  skip_before_action :verify_authenticity_token

  # Load cancan setup
  load_and_authorize_resource

  # GET /questions/:question_id/answers.json
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  # GET /questions/:question_id/answers/1.json
  def show
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  # POST /questions/:question_id/answers.json
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      render action: 'show', status: :created, location: [@question, @answer]
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/:question_id/answers/1
  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      head :no_content
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/:question_id/answers/1
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer
      @answer.destroy
      head :no_content
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content, :link)
  end

end
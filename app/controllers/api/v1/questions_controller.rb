#============================================================================
# Questions controller
#
class Api::V1::QuestionsController < Api::V1::ApiController

  # Don't do CSRF checks on this
  skip_before_action :verify_authenticity_token

  # Setup cancan rules
  load_and_authorize_resource

  # GET /questions.json
  def index
    @questions = Question.search(params[:search])
  end

  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
  end

  # POST /questions.json
  def create
    @question = Question.new(question_params)

    if can? :create
      if @question.save
        render action: 'show', status: :created, location: @question
      else
        render json: @question.errors, status: :unprocessable_entity
      end
    else
      render json: 'Cannot create question', status: :forbidden
    end
  end

  # PATCH/PUT /questions/1.json
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      head :no_content
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    head :no_content
  end

  private

  def question_params
    params.require(:question).permit(:description, :query)
  end
end
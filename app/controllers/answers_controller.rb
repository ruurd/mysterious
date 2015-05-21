class AnswersController < ApplicationController
  helper_method :sort_column, :sort_direction

  load_and_authorize_resource

  # GET /questions/:question_id/answers
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers.search(params[:search]).order(sort_specification).page(params[:page]).includes(:question).decorate
  end

  # GET /questions/:question_id//answers/1
  def show
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id]).decorate
  end

  # GET /questions/:question_id//answers/new
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    @answer.question = @question
  end

  # GET /questions/:question_id//answers/1/edit
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  # POST /questions/:question_id/answers
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to [@question, @answer], notice: 'Answer was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /questions/:question_idanswers/1
  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to [@question, @answer], notice: 'Answer was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /questions/:question_id/answers/1
  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.where(@question).find(params[:id])
    if @answer
      @answer.destroy
      redirect_to question_answers_url(@question)
    else
      redirect_to question_answers_url(@question), notice: 'Answer to be deleted could not be found.'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :content, :link)
  end

  def sort_column
    Answer.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end
end
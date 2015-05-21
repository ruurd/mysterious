class QuestionsController < ApplicationController
  helper_method :sort_column, :sort_direction

  load_and_authorize_resource

  # GET /questions
  def index
    @questions = Question.includes(:answers).search(params[:search]).order(sort_specification).page(params[:page]).includes(:user).decorate
  end

  # GET /questions/1
  def show
    @question = Question.find(params[:id]).decorate
  end

  def google_it
    question = Question.find(params[:id])
    if question
      ::GoogleAnswersWorker.new.google_answers(question)
      redirect_to action: 'come_back_later'
    end
  end

  def come_back_later
  end

  # GET /questions/new
  def new
    @question = Question.new
    @question.user_id = current_user.id
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id

    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /questions/1
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /questions/1
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_url
  end

  private

  def sort_column
    Question.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def question_params
    params.require(:question).permit(:description, :query)
  end


end
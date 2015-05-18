class AnswersController < ApplicationController
  helper_method :sort_column, :sort_direction

  # GET /questions/:question_id/answers
  # GET /answers.json
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers.search(params[:search]).order(sort_specification).page(params[:page]).includes(:question).decorate
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id]).decorate
  end

  # GET /answers/new
  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    @answer.question = @question
  end

  # GET /answers/1/edit
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @answer }
      else
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.where(@question).find(params[:id])
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.where(@question).find(params[:id])
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to question_answers_url(@question) }
      format.json { head :no_content }
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
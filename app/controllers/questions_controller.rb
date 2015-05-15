class QuestionsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.search(params[:search]).order(sort_specification).page(params[:page]).decorate
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id]).decorate
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
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @question = Question.find(params[:id])
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    Question.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def question_params
    params.require(:question).permit(:description, :query)
  end


end
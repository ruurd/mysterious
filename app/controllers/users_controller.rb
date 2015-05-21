class UsersController < ApplicationController
  helper_method :sort_column, :sort_direction

  load_and_authorize_resource

  # GET /users
  def index
    @users = User.search(params[:search]).order(sort_specification).page(params[:page]).decorate
  end

  # GET /users/1
  def show
    @user = User.find(params[:id]).decorate
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : 'id'
  end

  def user_params
    params.require(:user).permit(:email, :admin)
  end

end
class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new (form view)
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    end
  end

  # GET /users/:id/edit (form view)
  def edit
    @user = User.find(params[:id])
  end

  # PATCH or PUT /users/:id
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    end
  end

  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :dob, :email, :phone_number, :address)
    end
end
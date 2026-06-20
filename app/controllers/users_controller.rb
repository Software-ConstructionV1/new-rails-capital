class UsersController < ApplicationController
  # load the user up front so the actions below can share it
  before_action :set_user, only: %i[show edit update destroy]

  # list out every user we have (GET /users)
  def index
    @users = User.all
  end

  # show a single user's details (GET /users/:id)
  def show
  end

  # empty form for adding a new user (GET /users/new)
  def new
    @user = User.new
  end

  # the form again, already filled in for editing (GET /users/:id/edit)
  def edit
  end

  # try to save the new user; if a validation fails, show the form back (POST /users)
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "User was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # save edits to a user that already exists (PATCH/PUT /users/:id)
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # remove the user and go back to the list (DELETE /users/:id)
  def destroy
    @user.destroy
    redirect_to users_path, status: :see_other, notice: "User was successfully destroyed."
  end

  private

  # look the user up by id
  def set_user
    @user = User.find(params[:id])
  end

  # the only fields a user is allowed to set
  def user_params
    params.require(:user).permit(:name, :dob, :email, :phone_number, :address)
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all()
  end

  # get /users/new -> shows the form view
  def new
    @user = User.new()
  end

  # user /users
  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email], dob: params[:user][:dob], phone_number: params[:user][:phone_number], address: params[:user][:address])
    if @user.save()
      redirect_to @user, notice: "user has been created!!!"
    else
      render :new, status: :unprocessable_content
    end
  end

  # get /users/id
  def show
    @user = User.find(params[:id])
  end

  # get /users/id/edit
  def edit
    @user = User.find(params[:id])
  end

  # patch /users/id
  def update
    @user = User.find(params[:id])
    if @user.update(name: params[:user][:name], email: params[:user][:email], dob: params[:user][:dob], phone_number: params[:user][:phone_number], address: params[:user][:address])
      redirect_to @user, notice: "User has been updated succesfully"
    else
      render :edit, status: :unprocessable_content
    end
  end

  # delete /users/id
  def destroy
    @user = User.find(params[:id])
    @user.destroy()
    redirect_to @user, notice: "user is deleted!!!"
  end
end

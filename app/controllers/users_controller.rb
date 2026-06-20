class UsersController < ApplicationController
  # GET /users
  def index
    @users = User.all
  end
  # GET /users/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end
  # user /users
  def create
    @user = User.new(
    name: params[:user][:name],
    email: params[:user][:email],
    dob: params[:user][:dob],
    phone_number: params[:user][:phone_number],
    address: params[:user][:address],
    )
    redirect_to @user
  end
  # GET /users/edit/:id
  def edit
    @user = User.find(params[:id])
  end
  # PATCH /users/:id
  def update
    @p
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.dob = params[:user][:dob]
    @user.phone_number = params[:user][:phone_number]
    @user.address = params[:user][:address]
    @user.save

    redirect_to @user
  end
  # DELETE /users/:id
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to @user
  end
end

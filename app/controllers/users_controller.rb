class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(name: params[:user][:name], dob: params[:user][:dob], email: params[:user][:email], phone_number: params[:user][:phone_number], address: params[:user][:address])
    if @user.save
      redirect_to @user, notice: "user created!"
    else
      render :new, status: :unprocessable_content
    end
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(name: params[:user][:name], dob: params[:user][:dob], email: params[:user][:email], phone_number: params[:user][:phone_number], address: params[:user][:address])
      redirect_to @user, notice: "user updated!"
    else
      render :new, status: :unprocessable_content
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "user deleted!"
  end
end

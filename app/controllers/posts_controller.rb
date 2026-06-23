class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    @users = User.all
    @editors = Editor.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Post created successfully."
    else
      @users = User.all
      @editors = Editor.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @users = User.all
    @editors = Editor.all
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post updated successfully."
    else
      @users = User.all
      @editors = Editor.all
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :user_id, editor_ids: [])
  end
end
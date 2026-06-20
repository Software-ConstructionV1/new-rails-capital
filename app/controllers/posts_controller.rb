class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  # /posts/new
  def new 
    @post = Post.new
  end
  def create
    @post = Post.new(title: params[:post][:title], content: params[:post][:content])
    if @post.save
      redirect_to @post, notice: "post created!"
    else
      render :new, status: :unprocessable_content
    end
  end
  def show
    @post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    if @post.update(title: params[:post][:title], content: params[:post][:content])
      redirect_to @post,notice: "post updated!"
    else 
      render :new, status: :unprocessable_content
    end
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "post deleted!"
  end
end

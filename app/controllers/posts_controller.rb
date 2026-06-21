class PostsController < ApplicationController
  # get /posts
  def index
    @posts = Post.all()
  end

  # get /posts/new -> shows the form view
  def new
    @post = Post.new()
  end

  # post /posts
  def create
    @post = Post.new(title: params[:post][:title], content: params[:post][:content])
    if @post.save()
      redirect_to @post, notice: "product has been created!!!"
    else
      render :new, status: :unprocessable_content
    end
  end

  # get /posts/id
  def show
    @post = Post.find(params[:id])
  end

  # get /posts/id/edit
  def edit
    @post = Post.find(params[:id])
  end

  # patch /posts/id
  def update
    @post = Post.find(params[:id])
    if @post.update(title: params[:post][:title], content: params[:post][:content])
      redirect_to @post, notice: "Product has been updated succesfully"
    else
      render :edit, status: :unprocessable_content
    end
  end

  # delete /posts/id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy()
    redirect_to @post, notice: "Post is deleted!!!"
  end
end
class PostsController < ApplicationController
  # your code goes here
  # GET /posts
  def index
    @posts = Post.all
  end
  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    @post = Post.new
  end
  # POST /posts
  def create
    @post = Post.new(title: params[:post][:title], content: params[:post][:content])
    redirect_to @post
  end
  # GET /posts/edit/:id
  def edit
    @post = Post.find(params[:id])
  end
  # PATCH /posts/:id
  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    @post.save

    redirect_to @post
  end
  # DELETE /posts/:id
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to @post
  end
end

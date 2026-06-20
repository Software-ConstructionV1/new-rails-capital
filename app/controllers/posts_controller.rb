class PostsController < ApplicationController
  # get /posts
  def index
    @posts= Post.all
  end

  # get /posts/new
  def new
    @post= Post.new # empty obj for the form 
  end

  # post /posts
  def create
    @post = Post.new(title: params[:post][:title], content:  params[:post][:content])
    if @post.save 
      redirect_to @post, notice: "Post Created Sucessfully" #goes to show route
    else
      render :new, status: :unprocessable_content
    end
  end

  #get /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  #get /posts/:id/edit
  def edit
    @post=Post.find(params[:id])
  end

  #patch /posts/:id
  def update
    @post= Post.find(params[:id])
    if @post.update(title: params[:post][:title], content:  params[:post][:content])
      redirect_to @post, notice: "Post Updated Sucessfully" #goes to show route
    else
      render :edit, status: :unprocessable_content
    end
  end

  #delete /posts/:id
  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to :posts
  end
end

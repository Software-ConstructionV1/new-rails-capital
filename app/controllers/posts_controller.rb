class PostsController < ApplicationController
  # grab the post first so show/edit/update/destroy can all reuse it
  before_action :set_post, only: %i[show edit update destroy]

  # the posts homepage, just list everything out (GET /posts)
  def index
    @posts = Post.all
  end

  # take a look at one post on its own (GET /posts/:id)
  def show
  end

  # blank form for writing a brand new post (GET /posts/new)
  def new
    @post = Post.new
  end

  # same form as new, but pre-filled so you can change stuff (GET /posts/:id/edit)
  def edit
  end

  # actually save the post the form sent us (POST /posts)
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # save the edits to a post that already exists (PATCH/PUT /posts/:id)
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # delete the post, then send the user back to the list (DELETE /posts/:id)
  def destroy
    @post.destroy
    redirect_to posts_path, status: :see_other, notice: "Post was successfully destroyed."
  end

  private

  # find the post we're working on by its id
  def set_post
    @post = Post.find(params[:id])
  end

  # only let title and content through, ignore anything else
  def post_params
    params.require(:post).permit(:title, :content)
  end
end

class PostsController < ApplicationController
  def index
    @posts = {"first_post": "this is the first post", "second_post": "this is the second post"}
  end
end

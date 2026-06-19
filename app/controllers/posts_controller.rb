class PostsController < ApplicationController
  def index
    @posts = [{"title": "First Post", "content": "this is the first post content"}, {"title": "Second Post", "content": "this is the second post content"}]
  end
end

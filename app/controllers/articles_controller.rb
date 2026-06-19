class ArticlesController < ApplicationController
  def index
    @articles = [
    "article1",
    "article2",
    "article3",
    ]
  end
end

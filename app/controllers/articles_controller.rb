class ArticlesController < ApplicationController
  # GET /articles
  # Grab every article and hand them to the view.
  def index
    @articles = Article.all
  end
end

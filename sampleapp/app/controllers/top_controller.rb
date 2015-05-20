class TopController < ApplicationController
  def index
    @article = Article.readable.order("released_at DESC").limit(5)
  end

  def about
  end
end

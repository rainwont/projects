# coding: utf-8

class ArticlesController < ApplicationController
  # 記事一覧
  def index
    @articles = Article.order("release_at DESC")
  end
  
end

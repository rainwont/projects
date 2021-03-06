# coding: utf-8

class ArticlesController < ApplicationController
  # 記事一覧
  def index
    #@articles = Article.order("released_at DESC")
    @articles = Article.readable_for(@current_member).
      order("released_at DESC")
  end

  def show
    params.permit!
  #  @article = Article.find(params[:id])
    @article = Article.readable_for(@current_member).
      find(params[:id])
  end

  # 新規作成
  def new
    @article = Article.new
  end

  # 編集フォーム
  def edit
    @article = Article.find(params[:id])
  end

  # 新規作成
  def create
    params.permit!
    @article = Article.new(params[:article])
    if @article.save
      redirect_to @article, notice: "ニュース記事を登録しました"
    else
      render "new"
    end
  end

  # 更新
  def update
    params.permit!
    @article = Article.find(params[:id])
    @article.assign_attributes(params[:article])
    if @article.save
      redirect_to @article, notice: "ニュース記事を更新しました"
    else
      render "edit"
    end
  end


  # 削除
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :articles, notice: "ニュース記事を削除しました"
  end

end

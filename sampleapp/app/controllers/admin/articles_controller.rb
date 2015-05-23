# coding: utf-8

class Admin::ArticlesController < Admin::Base
  # 記事一覧
  def index
    @articles = Article.order("released_at DESC")
  end

  # 記事詳細
  def show
    @article = Article.find(params[:id])
  end

  # 新規登録フォーム
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
    @article = Article.new(params[:article], as: :admin)
    if @article.save
      redirect_to [:admin, @article], notice: "ニュース記事を登録しました。"
    else
      render "new"
    end
  end

  # 更新
  def update
    params.permit!
=begin
      @article = Article.find(params[:id])
      @article.assign_attributes(params[:article], as: :admin)
      if @article.save
        redirect_to [:admin, @article], notice: "ニュース記事を更新しました"
=end

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
    redirect_to :admin_articles, notice: "ニュース記事を削除しました。"
  end
end

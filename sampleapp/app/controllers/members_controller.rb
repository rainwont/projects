class MembersController < ApplicationController

  def index
    @members = Member.order("number")
  end

  def show

  end

  def new

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  # 検索
  def search
    @members = Member.search(params[:q])
    render "index"
  end
end

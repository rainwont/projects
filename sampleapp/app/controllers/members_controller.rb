class MembersController < ApplicationController

  before_filter :login_required

  def index
    @members = Member.order("number")
  end

  def show
    @member = Member.find(params[:id])
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "members/show"
    end
  end

  def new
    @member = Member.new(birthday: Date.new(1980, 1, 1))
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    params.permit!
    @member = Member.new(params[:member])
    if @member.save
      redirect_to @member, notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  def update
    params.permit!
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to @member, notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    params.permit!
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :members, notice: "会員情報を削除しました。"
  end

  # 検索
  def search
    @members = Member.search(params[:q])
    render "index"
  end

  private
  # 画像送信
  def send_image
    if @member.image.present?
      send_data @member.image.data,
        type: @member.image.content_type, disposition: "inline"
    else
      raise NotFound
    end
  end

end

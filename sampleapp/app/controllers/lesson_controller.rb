# coding: utf-8

class LessonController < ApplicationController
  before_filter :do_before, only: [:step7, :hogefilter]

 def step1
   render text: "こんにちは #{params[:name]}さん"
 end

 def step2
   render text: params[:controller] +  "#" + params[:action]
   # render text: request.env["HTTP_USER_AGANT"]
 end

 def step3
   redirect_to action: "step4", status: 302
 end

 def step4
   render text: "step3からリダイレクトされました。"
 end

 def step5
   flash[:notice] = "この文章はstep5で代入されました"
   redirect_to action: "step6", status:302
 end

 def step6
   render text: flash[:notice]
 end

=begin
 def redirect1
   redirect_to @menber, notice: "会員登録しました"
 end
=end

 def step7
   render text: @message
 end

 def hogefilter
   render text: @message
 end

 def step8
   @price = (2000 * 1.05).floor
 end

 def step9
   @price = 777
   render "step8"
 end

 def step10
   @comment ="<script>alert('危険')</alert>こんにちは"
 end

 def step11
   @comment = "<strong>安全なHTML</strong>"
 end

 def kiken
   @comment = "<script>alert('危険')</script>こんにちはこんにちは"
 end

 def step12
   @population = 704414
   @surface = 141.31
 end

 def step13
   @time = Time.now
 end

 def population
   @population = 12774390
 end

 def kyocho
   @comment = "強調"
 end

 def step15
   @message = "ヘルパーメソッドを自作\n改行のテスト"
 end




 private
  def do_before
    @message = "do_beforeのテスト"
  end




end

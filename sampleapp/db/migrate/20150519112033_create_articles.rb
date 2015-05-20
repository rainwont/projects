class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false  #タイトル
      t.text :body, null: false     #本文
      t.datetime :release_at, null: false #掲載開始日時
      t.datetime :expired_at        #掲載終了日時
      t.boolean :member_only, null: false #会員のみフラグ

      t.timestamps
    end
  end
end

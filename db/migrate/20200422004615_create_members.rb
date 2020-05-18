class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :last_name, null: false 
      t.string :last_name_phonetic, null: false 
      t.string :first_name, null: false 
      t.string :first_name_phonetic, null: false 
      t.string :face_photo_path
      t.string :birthplace
      t.integer :birth_year_month # フォーマット：yyyyMM形式
      t.integer :joining_year # フォーマット：yyyyMMDD形式
      t.string :one_word_comment # 一覧に表示する
      t.string :personality
      t.string :hobby
      t.string :favorite_things
      t.string :hate_things
      t.string :strong_point
      t.string :week_point
      t.string :special_skill
      t.string :week_things
      t.string :happy_done_things
      t.string :disgusted_things
      t.string :freedom_message
      t.datetime :deleted_at # '≠NULLの場合、論理削除されている
      
      t.timestamps
    end

    add_index :members, [ :last_name_phonetic, :first_name_phonetic ]
  end
end
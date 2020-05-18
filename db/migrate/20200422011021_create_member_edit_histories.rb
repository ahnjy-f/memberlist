class CreateMemberEditHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :member_edit_histories do |t|
      t.references :member,foreign_key: true, null: false, index: false # 社員テーブル
      t.string :face_photo_path
      t.string :one_word_comment
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
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end

    add_index :member_edit_histories, :created_at
    add_index :member_edit_histories, [ :member_id, :created_at ]
  end
end

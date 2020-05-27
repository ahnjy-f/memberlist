class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.references :member,foreign_key: true, null: false, index: false # 社員テーブル
      t.references :post, null: false, foreign_key: true
      t.string :reply, null: false
      t.integer :like,default: 0
      t.datetime :created_at, null: false
    end
    add_index :replies, :created_at
    add_index :replies, [ :member_id, :created_at ]
  end
end

class CreateLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :likes do |t|
      t.references :member,foreign_key: true, null: false, index: false # 社員テーブル
      t.boolean :like,default: false
      t.datetime :created_at, null: false
    end
    add_index :likes, :created_at
    add_index :likes, [ :member_id, :created_at ]
  end
end

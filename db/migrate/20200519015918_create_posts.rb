class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :member,foreign_key: true, null: false, index: false # 社員テーブル
      t.string :post, null: false
      t.datetime :created_at, null: false
    end
    add_index :posts, :created_at
    add_index :posts, [ :member_id, :created_at ]
  end
end
class CreateReplylikes < ActiveRecord::Migration[6.0]
  def change
    create_table :replylikes do |t|
      t.references :member,foreign_key: true, null: false, index: false # 社員テーブル
      t.boolean :like,default: false
      t.datetime :created_at, null: false
    end
    add_index :replylikes, :created_at
    add_index :replylikes, [ :member_id, :created_at ]
  end
end

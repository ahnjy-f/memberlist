class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.references :member,foreign_key: true, null: false, index: false # 社員テーブル.ID
      t.string :mail_address, null: false
      t.string :password_digest, null: false # ハッシュ化して登録
      t.string :admin_flag, null: false # 0:一般、1:システム管理者
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false 
    end

    add_index :accounts, :created_at
    add_index :accounts, [ :member_id, :created_at ]
  end
end
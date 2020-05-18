require "pp"
class Account::LoginForm
    include ActiveModel::Model
    pp "フォームに入りました"
    attr_accessor :mail_address, :password
end

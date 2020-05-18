require "pp"
class Account::Authenticator
    def initialize(account_info)
        @account_info= account_info
    end

    def authenticate(p)
        #データベースが　作る前まではこれを作ります hashを使えません
        # pp @account_info && @account_info.password_digest == p
        # @account_info && @account_info.password_digest == p


        pp "パスワードを確認中です．"
        pp @account_info && BCrypt::Password.new(@account_info.password_digest) == p
        pp "確認結果"
        pp @account_info && BCrypt::Password.new(@account_info.password_digest) == p
        @account_info && BCrypt::Password.new(@account_info.password_digest) == p 
        

    end
end
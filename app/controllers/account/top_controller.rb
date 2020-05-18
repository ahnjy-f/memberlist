require "pp"
class Account::TopController < Account::Base
    def index
        if current_account
            pp "ログイン成功"
            @current_account = current_account
            @current_member = current_member
            render action: "index"
        else
            pp "login ページに戻ります"
            redirect_to :account_login
        end
    end
end

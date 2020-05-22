require "pp"
class Account::TopController < Account::Base
    def index
        if current_account
            pp "ログイン成功"
            @current_account = current_account
            @current_member = current_member
            redirect_to :account_show
        else
            redirect_to :account_login
        end
    end
end
